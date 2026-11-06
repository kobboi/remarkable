#!/usr/bin/env python3
"""Print an NPM_SRC_URI block for an ebuild from an npm package-lock.json (v2/v3).

Usage: npm-src-uri.py path/to/package-lock.json

Every registry tarball becomes a distfile named npm-<scope+>name-version.tgz.npm.
The extra ".npm" suffix makes Portage's unpack (and go-module's EGO_SUM unpack
loop) skip them; the ebuild feeds them to an offline npm cache instead.

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


def main(lockfile):
    packages = json.load(open(lockfile))["packages"]
    common, per_arch = set(), {a: set() for a in ARCHES.values()}
    for key, meta in packages.items():
        url = meta.get("resolved")
        if not key or not url or meta.get("link"):
            continue
        if not url.startswith(REGISTRY):
            sys.exit(f"non-registry dependency, handle by hand: {key} {url}")
        entry = (url, distfile(url))
        os_, cpu = meta.get("os"), meta.get("cpu")
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
