# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 optfeature

# 0.3.0 pins rmscene<0.7, which cannot read files from current tablet
# firmware; use a snapshot that supports rmscene 0.8.
COMMIT="d140843eca0eed59a1211b26560a01cd530bcd65"

DESCRIPTION="Convert reMarkable v6 .rm files to SVG, PDF and Markdown"
HOMEPAGE="https://github.com/ricklupton/rmc"
SRC_URI="https://github.com/ricklupton/rmc/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/click-8[${PYTHON_USEDEP}]
	>=dev-python/rmscene-0.8.0[${PYTHON_USEDEP}]
	<dev-python/rmscene-0.9[${PYTHON_USEDEP}]
"

# upstream has no pytest modules, only sample .rm files; smoke-test the CLI
IUSE="test"
RESTRICT="!test? ( test )"

src_prepare() {
	distutils-r1_src_prepare
	# poetry-core rejects the PEP 440-invalid "0.3.1-dev"
	sed -i -e '/^version = /s/".*"/"0.3.1.dev0"/' pyproject.toml || die
}

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
