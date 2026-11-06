# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Read-only access to ext4 filesystem images in pure Python"
HOMEPAGE="
	https://github.com/Eeems/python-ext4
	https://pypi.org/project/ext4/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cachetools[${PYTHON_USEDEP}]
	dev-python/crcmod[${PYTHON_USEDEP}]
"

src_prepare() {
	distutils-r1_src_prepare
	# Upstream compiles the package to C with Nuitka; the plain Python
	# sources work the same.  Also drop the exact == pins.
	sed -i \
		-e 's/build-backend = "nuitka.distutils.Build"/build-backend = "setuptools.build_meta"/' \
		-e 's/, *"nuitka[^"]*"//' \
		-e '/^dependencies/,/^]/s/==/>=/' \
		pyproject.toml || die
}
