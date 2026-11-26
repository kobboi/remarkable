# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Python library for the reMarkable cloud API and local document models"
HOMEPAGE="
	https://github.com/RedTTGMoss/rm_api
	https://pypi.org/project/rm-api/
"
# PyPI only has a wheel
SRC_URI="
	https://github.com/RedTTGMoss/${MY_PN}/archive/refs/tags/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# PyPDF2 is gone from ::gentoo; pypdf is its successor with the same
# PdfReader, the only part used. httpx and packaging are listed upstream
# but never imported.
RDEPEND="
	>=dev-python/aiohttp-3.11.6[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/crc32c-2.7.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.9.0[${PYTHON_USEDEP}]
	dev-python/pypdf[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.44[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.8.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	sed -i -e "s/0.0.0+replaced-by-ci/${PV}/" \
		-e 's/"pypdf2 (/"pypdf (/' \
		-e '/"httpx (/d' -e '/"packaging (/d' pyproject.toml || die
	sed -i -e 's/^from PyPDF2 import/from pypdf import/' rm_api/helpers.py || die
	distutils-r1_src_prepare
}

python_test() {
	# live_tests/ need a reMarkable cloud account
	epytest rm_api/tests
}

python_install() {
	distutils-r1_python_install
	# upstream ships its tests and their data inside the package
	rm -r "${D}$(python_get_sitedir)"/${MY_PN}/tests || die
}
