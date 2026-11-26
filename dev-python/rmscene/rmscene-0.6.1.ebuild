# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

DESCRIPTION="Read and write v6 .rm files from the reMarkable tablet"
HOMEPAGE="
	https://github.com/ricklupton/rmscene
	https://pypi.org/project/rmscene/
"
# PyPI sdist lacks the test suite and its sample files
SRC_URI="https://github.com/ricklupton/rmscene/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="dev-python/packaging[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/hypothesis[${PYTHON_USEDEP}] )"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
	# upstream caps packaging at ^23.0 for no technical reason
	sed -i -e '/^packaging = /s/"\^23.0"/">=23.0"/' pyproject.toml || die
}
