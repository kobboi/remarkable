#!/usr/bin/env python3
"""Print an NPM_SRC_URI block for an ebuild from an npm package-lock.json
(v2/v3) or a pnpm-lock.yaml (v9).

Usage: npm-src-uri.py path/to/package-lock.json
       npm-src-uri.py path/to/pnpm-lock.yaml

Every registry tarball becomes a distfile named npm-<scope+>name-version.tgz.npm.
The extra ".npm" suffix makes Portage's unpack (and go-module's EGO_SUM unpack
loop) skip them; the ebuild feeds them to an offline npm cache, or points the
pnpm lockfile at them.

Platform-specific packages (esbuild, rollup, ...) are kept only for Linux on
the CPUs mapped in ARCHES, wrapped in the matching Gentoo arch conditional.
"""
import json
import sys

REGISTRY = "https://registry.npmjs.org/"
ARCHES = {"x64": "amd64", "arm64": "arm64"}


def distfile(url):
    path = url[len(REGISTRY):]
    pkg, _, tarball = path.partition("/-/")
    scope = pkg.split("/")[0] + "+" if pkg.startswith("@") else ""
    return f"npm-{scope}{tarball}.npm"


def npm_packages(lockfile):
    """Yield (name, url, os, cpu) for every tarball in a package-lock.json."""
    packages = json.load(open(lockfile))["packages"]
    for key, meta in packages.items():
        url = meta.get("resolved")
        if not key or not url or meta.get("link"):
            continue
        if not url.startswith(REGISTRY):
            sys.exit(f"non-registry dependency, handle by hand: {key} {url}")
        yield key, url, meta.get("os"), meta.get("cpu")


def pnpm_packages(lockfile):
    """Yield (name, url, os, cpu) for every tarball in a pnpm-lock.yaml.

    pnpm records only the integrity of registry packages; the tarball URL
    follows from the package name and version.
    """
    import yaml

    lock = yaml.safe_load(open(lockfile))
    if str(lock.get("lockfileVersion")) != "9.0":
        sys.exit(f"unsupported pnpm lockfile version {lock.get('lockfileVersion')}")
    for key, meta in (lock.get("packages") or {}).items():
        resolution = meta["resolution"]
        if set(resolution) != {"integrity"}:
            sys.exit(f"non-registry dependency, handle by hand: {key} {resolution}")
        name, _, version = key[1:].partition("@")
        name = key[0] + name
        url = f"{REGISTRY}{name}/-/{name.split('/')[-1]}-{version}.tgz"
        yield key, url, meta.get("os"), meta.get("cpu")


def main(lockfile):
    reader = pnpm_packages if lockfile.endswith(".yaml") else npm_packages
    common, per_arch = set(), {a: set() for a in ARCHES.values()}
    for _key, url, os_, cpu in reader(lockfile):
        entry = (url, distfile(url))
        if os_ and "linux" not in os_:
            continue
        if cpu:
            for npm_cpu, arch in ARCHES.items():
                if npm_cpu in cpu:
                    per_arch[arch].add(entry)
            continue
        common.add(entry)

    def emit(entries, indent):
        for url, name in sorted(entries):
            print(f"{indent}{url}")
            print(f"{indent}\t-> {name}")

    print('NPM_SRC_URI="')
    emit(common, "\t")
    for arch, entries in per_arch.items():
        if entries:
            print(f"\t{arch}? (")
            emit(entries, "\t\t")
            print("\t)")
    print('"')


if __name__ == "__main__":
    main(sys.argv[1])
