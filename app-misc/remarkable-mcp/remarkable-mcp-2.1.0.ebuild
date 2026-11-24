# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYPI_PN="remarkable_mcp"
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="MCP server that lets AI assistants read and search reMarkable documents"
HOMEPAGE="
	https://github.com/SamMorrowDrums/remarkable-mcp
	https://pypi.org/project/remarkable-mcp/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# ebooklib is listed in pyproject.toml but never imported
RDEPEND="
	>=dev-python/beautifulsoup4-4.12.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-it-py-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/mcp-2.0.0[${PYTHON_USEDEP}]
	<dev-python/mcp-3[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/pymupdf-1.26.7[${PYTHON_USEDEP}]
	>=dev-python/pytesseract-0.3.10[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
	>=dev-python/rmscene-0.8.0[${PYTHON_USEDEP}]
	virtual/openssh
"

EPYTEST_PLUGINS=( pytest-asyncio )
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
	sed -i -e '/"ebooklib/d' pyproject.toml || die
}

pkg_postinst() {
	optfeature "OCR of handwriting with Tesseract" app-text/tesseract
	elog "Register the server with your MCP client, e.g. for Claude Code:"
	elog "  claude mcp add remarkable -- remarkable-mcp --ssh"
	elog "See /usr/share/doc/${PF}/README.md* for the cloud, SSH and USB"
	elog "web interface modes and their options."
}
