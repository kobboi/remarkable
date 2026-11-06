#!/usr/bin/env python3
"""Print a CRATES block for cargo.eclass from a Cargo.lock."""
import sys
import tomllib

with open(sys.argv[1], "rb") as f:
    lock = tomllib.load(f)

crates = []
for pkg in lock["package"]:
    source = pkg.get("source", "")
    if source.startswith("git+"):
        sys.exit(f"git dependency {pkg['name']} needs GIT_CRATES")
    if source.startswith("registry+"):
        crates.append(f"{pkg['name']}@{pkg['version']}")

print('CRATES="')
for c in crates:
    print(f"\t{c}")
print('"')
