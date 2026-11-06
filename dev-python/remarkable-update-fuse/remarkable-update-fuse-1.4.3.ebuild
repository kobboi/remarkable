# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN="remarkable_update_fuse"
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Mount reMarkable OS update images as a FUSE filesystem"
HOMEPAGE="
	https://github.com/Eeems-Org/remarkable-update-fuse
	https://pypi.org/project/remarkable-update-fuse/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/fuse-python[${PYTHON_USEDEP}]
	dev-python/remarkable-update-image[${PYTHON_USEDEP}]
"

src_prepare() {
	distutils-r1_src_prepare
	# Build as plain Python instead of compiling with Nuitka; the
	# dependencies come from requirements.txt, so drop its == pins
	sed -i \
		-e 's/build-backend = "nuitka.distutils.Build"/build-backend = "setuptools.build_meta"/' \
		-e 's/, *"nuitka[^"]*"//' \
		pyproject.toml || die
	sed -i -e 's/==.*//' requirements.txt || die
}
