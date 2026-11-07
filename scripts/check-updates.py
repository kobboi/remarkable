#!/usr/bin/env python3
"""Check the overlay's packages for newer upstream versions.

Usage: check-updates.py [-q] [category/package ...]

Where each package is checked:
  - PyPI, for packages with a <remote-id type="pypi"> in metadata.xml
  - the reMarkable developer links page, for dev-embedded/remarkable-sdk-bin
  - codexctl's firmware list, for dev-embedded/remarkable-os-*-bin
  - the GitHub repo in HOMEPAGE otherwise: its release tags with
    "git ls-remote", and for snapshot ebuilds (COMMIT=) also the newest
    commit on the default branch

GitHub API calls (only made to date a new snapshot commit) use GITHUB_TOKEN
or "gh auth token" when available. Exits 1 if anything is outdated, 2 if a
check failed.
"""
import argparse
import json
import os
import re
import subprocess
import sys
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
SKIP = {"app-misc/remarkable-meta"}
SDK_LINKS = "https://developer.remarkable.com/links"
OS_VERSIONS = "https://raw.githubusercontent.com/Jayy001/codexctl/main/data/version-ids.json"
# remarkable-os-<device>-bin -> its key in codexctl's version list
OS_DEVICES = {"rm1": "remarkable1", "rm2": "remarkable2", "ferrari": "remarkablepp",
              "chiappa": "remarkableppm", "tatsu": "remarkableppure"}
# Tags that are plain releases: 1.2.3, v1.2.3
RELEASE_TAG = re.compile(r"^v?(\d+(?:\.\d+)*)$")


def vkey(version):
    """Sort key for release versions: 1.2.1 < 1.2.1.post5 < 1.2.2."""
    return tuple(int(n) for n in re.findall(r"\d+", version))


def fetch(url, headers=None):
    req = urllib.request.Request(url, headers={"User-Agent": "check-updates", **(headers or {})})
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read().decode()


def github_token():
    if token := os.environ.get("GITHUB_TOKEN"):
        return token
    try:
        return subprocess.run(["gh", "auth", "token"], capture_output=True,
                              text=True, check=True).stdout.strip()
    except (OSError, subprocess.CalledProcessError):
        return None


def ls_remote(repo, *args, refs=()):
    out = subprocess.run(["git", "ls-remote", *args, f"https://github.com/{repo}", *refs],
                         capture_output=True, text=True, check=True, timeout=60).stdout
    return [line.split("\t") for line in out.splitlines()]


def latest_tag(repo):
    versions = []
    for _, ref in ls_remote(repo, "--tags", "--refs"):
        if m := RELEASE_TAG.match(ref.removeprefix("refs/tags/")):
            versions.append(m.group(1))
    return max(versions, key=vkey, default=None)


def commit_date(repo, sha, token):
    headers = {"Accept": "application/vnd.github+json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    data = json.loads(fetch(f"https://api.github.com/repos/{repo}/commits/{sha}", headers))
    return data["commit"]["committer"]["date"][:10].replace("-", "")


class Package:
    def __init__(self, path):
        self.path = path
        self.name = f"{path.parent.name}/{path.name}"
        pvs = [e.name[len(path.name) + 1:-len(".ebuild")] for e in path.glob("*.ebuild")]
        self.pv = max(pvs, key=vkey)
        self.ebuild = (path / f"{path.name}-{self.pv}.ebuild").read_text()
        meta = path / "metadata.xml"
        meta = meta.read_text() if meta.exists() else ""
        m = re.search(r'<remote-id type="pypi">([^<]+)</remote-id>', meta)
        self.pypi = m and m.group(1)
        m = re.search(r'^COMMIT="([0-9a-f]+)"', self.ebuild, re.M)
        self.commit = m and m.group(1)
        m = re.search(r"https://github\.com/([\w.-]+/[\w.-]+)", self.ebuild)
        self.github = m and m.group(1).removesuffix(".git")

    def check(self, token):
        """Return (latest, note), latest being None when up to date."""
        if self.name == "dev-embedded/remarkable-sdk-bin":
            found = re.findall(r"remarkable-codex-toolchain/(\d+(?:\.\d+)+)/", fetch(SDK_LINKS))
            latest = max(found, key=vkey)
            return (latest, "") if vkey(latest) > vkey(self.pv) else (None, "")
        if m := re.fullmatch(r"dev-embedded/remarkable-os-(\w+)-bin", self.name):
            data = json.loads(fetch(OS_VERSIONS))
            latest = max(data[OS_DEVICES[m.group(1)]], key=vkey)
            note = "run scripts/os-image-ebuilds.py"
            return (latest, note) if vkey(latest) > vkey(self.pv) else (None, "")
        if self.pypi:
            latest = json.loads(fetch(f"https://pypi.org/pypi/{self.pypi}/json"))["info"]["version"]
            current = self.pv.replace("_p", ".post")
            return (latest, "") if vkey(latest) > vkey(current) else (None, "")
        if not self.github:
            raise RuntimeError("no upstream found")

        # A snapshot like 0.3.1_pre20260405 is superseded by tag 0.3.1. For
        # 0_pre snapshots any tags predate the snapshot, so only HEAD counts.
        base, snapshot, _ = self.pv.partition("_pre")
        if base != "0" or not snapshot:
            tag = latest_tag(self.github)
            if tag and (vkey(tag) >= vkey(base) if snapshot else vkey(tag) > vkey(base)):
                return tag, "new release"
        if self.commit:
            head = ls_remote(self.github, refs=["HEAD"])[0][0]
            if head != self.commit:
                try:
                    date = commit_date(self.github, head, token)
                    return f"{base}_pre{date}", f"commit {head[:12]}"
                except Exception:
                    return f"{base}_pre?", f"commit {head[:12]} (date lookup failed)"
        return None, ""


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("-q", "--quiet", action="store_true", help="only list outdated packages")
    ap.add_argument("packages", nargs="*", help="category/package to check (default: all)")
    args = ap.parse_args()

    paths = sorted(p.parent for p in REPO.glob("*-*/*/*.ebuild"))
    pkgs = {}
    for path in paths:
        name = f"{path.parent.name}/{path.name}"
        if name not in SKIP and not name.startswith("acct-"):
            pkgs.setdefault(name, path)
    if args.packages:
        unknown = set(args.packages) - pkgs.keys()
        if unknown:
            sys.exit(f"unknown package(s): {' '.join(sorted(unknown))}")
        pkgs = {n: pkgs[n] for n in args.packages}

    token = github_token()

    def run(path):
        pkg = Package(path)
        try:
            return pkg, *pkg.check(token), None
        except Exception as e:
            return pkg, None, "", e

    with ThreadPoolExecutor(max_workers=8) as pool:
        results = list(pool.map(run, pkgs.values()))

    width = max(len(n) for n in pkgs)
    outdated = failed = False
    for pkg, latest, note, error in results:
        if error:
            failed = True
            print(f"{pkg.name:<{width}}  {pkg.pv:<20}  ERROR: {error}")
        elif latest:
            outdated = True
            print(f"{pkg.name:<{width}}  {pkg.pv:<20}  -> {latest}  {note}".rstrip())
        elif not args.quiet:
            print(f"{pkg.name:<{width}}  {pkg.pv:<20}  ok")
    sys.exit(2 if failed else 1 if outdated else 0)


if __name__ == "__main__":
    main()
