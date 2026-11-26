# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 optfeature

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Python API for librm_lines: parse and render reMarkable .rm pages"
HOMEPAGE="
	https://github.com/RedTTGMoss/pylibrm_lines
	https://pypi.org/project/pylibrm-lines/
"
# PyPI only has a wheel
SRC_URI="
	https://github.com/RedTTGMoss/${MY_PN}/archive/refs/tags/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# ipykernel is listed upstream but never imported; pymupdf is only used
# through a page object the caller passes in
RDEPEND="
	>=dev-python/pillow-12.1.1[${PYTHON_USEDEP}]
	>=dev-python/rm-api-1.3.4[${PYTHON_USEDEP}]
	>=dev-python/rm-lines-sys-1.4.9[${PYTHON_USEDEP}]
	<dev-python/rm-lines-sys-1.5[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	sed -i -e "s/0.0.0+replaced-by-ci/${PV}/" \
		-e '/"ipykernel (/d' -e '/"pymupdf>=/d' pyproject.toml || die
	# import the installed package, not a second copy from the source tree
	sed -i -e 's/^from src\.pylibrm_lines import/from pylibrm_lines import/' \
		tests/test_001_tree_from_document.py || die
	# pymupdf is only keyworded on amd64; skip its one test without it
	sed -i -e 's/^import pymupdf$/import pytest\npymupdf = pytest.importorskip("pymupdf")/' \
		tests/test_004_backdrop.py || die
	distutils-r1_src_prepare
}

python_test() {
	# the tests share renderers through class state and must run in order;
	# test_003_outputs needs pygameextra, which is not packaged
	rm -rf results || die
	epytest tests/test_00{1,2,4}_*.py tests/test_999_destroy.py
}

pkg_postinst() {
	optfeature "PDF page backdrops" dev-python/pymupdf
}
