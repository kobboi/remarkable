# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN="remarkable_update_image"
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Read the root filesystem out of reMarkable OS update images"
HOMEPAGE="
	https://github.com/Eeems/remarkable-update-image
	https://pypi.org/project/remarkable-update-image/
"

LICENSE="MIT"
SLOT="0"
# indexed-gzip is only keyworded on amd64
KEYWORDS="~amd64"

# update_metadata_pb2.py was generated with protoc 7.34.1 and refuses to
# load with an older protobuf runtime
RDEPEND="
	dev-python/cachetools[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/ext4[${PYTHON_USEDEP}]
	dev-python/indexed-gzip[${PYTHON_USEDEP}]
	dev-python/libconf[${PYTHON_USEDEP}]
	>=dev-python/protobuf-7.34.1:=[${PYTHON_USEDEP}]
"

src_prepare() {
	distutils-r1_src_prepare
	# Build as plain Python instead of compiling with Nuitka, and drop
	# the exact == pins
	sed -i \
		-e 's/build-backend = "nuitka.distutils.Build"/build-backend = "setuptools.build_meta"/' \
		-e 's/, *"nuitka[^"]*"//' \
		-e '/^dependencies/,/^]/s/==/>=/' \
		pyproject.toml || die
}
