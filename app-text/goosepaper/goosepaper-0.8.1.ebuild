# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Generate daily newspapers from RSS, Wikipedia and more for e-ink tablets"
HOMEPAGE="
	https://github.com/j6k4m8/goosepaper
	https://pypi.org/project/goosepaper/
"

LICENSE="Apache-2.0"
SLOT="0"
# weasyprint and readability-lxml are not keyworded on arm64
KEYWORDS="~amd64"

# dev-python/EbookLib and dev-python/readability-lxml come from ::guru
RDEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/EbookLib[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/lxml-html-clean[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/readability-lxml[${PYTHON_USEDEP}]
	>=dev-python/remarkapy-0.3.1[${PYTHON_USEDEP}]
	<dev-python/remarkapy-0.4[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/weasyprint[${PYTHON_USEDEP}]
"

pkg_postinst() {
	elog "Example config:"
	elog "  https://github.com/j6k4m8/goosepaper/blob/v${PV}/example-config.json"
	elog "Upload to the reMarkable cloud with 'goosepaper --deliver'"
	elog "or 'upload_to_remarkable <file>'."
}
