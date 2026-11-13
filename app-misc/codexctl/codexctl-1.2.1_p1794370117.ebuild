# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="Download, install, inspect and downgrade reMarkable OS firmware"
HOMEPAGE="
	https://github.com/Jayy001/codexctl
	https://pypi.org/project/codexctl/
"

LICENSE="GPL-3"
SLOT="0"
# remarkable-update-image needs indexed-gzip, which is amd64-only
KEYWORDS="~amd64"
IUSE="+fuse"

# fuse: "codexctl mount"; the module is imported only for that command
RDEPEND="
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/remarkable-update-image[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	fuse? ( dev-python/remarkable-update-fuse[${PYTHON_USEDEP}] )
"

src_prepare() {
	distutils-r1_src_prepare
	# Upstream pins every dependency exactly and caps Python at <3.14 for
	# its frozen binary builds; neither matters for a system install.
	# remarkable-update-fuse is listed unconditionally on Linux, but it is
	# optional here.
	sed -i \
		-e '/^python = /s/".*"/">=3.12"/' \
		-e '/^\(paramiko\|psutil\|requests\|loguru\) = /s/"\([0-9]\)/">=\1/' \
		-e '/^remarkable-update-image = /s/.*/remarkable-update-image = ">=1.4.1"/' \
		-e '/^remarkable-update-fuse = /d' \
		pyproject.toml || die
}

pkg_postinst() {
	elog "codexctl downloads its list of firmware versions on first use and"
	elog "talks to the tablet over SSH (default 10.11.99.1 over USB)."
	elog "Flashing firmware can brick the device if interrupted; see"
	elog "  https://github.com/Jayy001/codexctl#readme"
	optfeature "mounting update images without root" sys-fs/fuse:0
}
