# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 optfeature

DESCRIPTION="Convert reMarkable v6 .rm files to SVG, PDF and Markdown"
HOMEPAGE="https://github.com/ricklupton/rmc"
# PyPI sdist lacks the sample .rm files used for testing
SRC_URI="https://github.com/ricklupton/rmc/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# rmscene 0.6 cannot read files from current tablet firmware; the
# 0.3.1_pre snapshots work with rmscene 0.8
RDEPEND="
	>=dev-python/click-8[${PYTHON_USEDEP}]
	>=dev-python/rmscene-0.6.0[${PYTHON_USEDEP}]
	<dev-python/rmscene-0.7[${PYTHON_USEDEP}]
"

# upstream has no pytest modules, only sample .rm files; smoke-test the CLI
IUSE="test"
RESTRICT="!test? ( test )"

python_test() {
	local f fmt
	for f in tests/rm/*.rm; do
		for fmt in svg markdown; do
			rmc -t ${fmt} -o "${T}/out.${fmt}" "${f}" ||
				die "rmc -t ${fmt} failed on ${f} with ${EPYTHON}"
		done
	done
}

pkg_postinst() {
	optfeature "PDF export (rmc -t pdf)" media-gfx/inkscape
}
