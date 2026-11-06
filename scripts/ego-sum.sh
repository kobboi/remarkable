#!/bin/sh
# Print an EGO_SUM array for an ebuild from a go.sum file.
# Usage: ego-sum.sh path/to/go.sum
printf 'EGO_SUM=(\n'
awk '{ print "\t\"" $1 " " $2 "\"" }' "$1"
printf ')\n'
