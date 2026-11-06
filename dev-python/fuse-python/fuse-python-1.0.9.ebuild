# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python bindings for FUSE 2 (the libfuse python-fuse module)"
HOMEPAGE="
	https://github.com/libfuse/python-fuse
	https://pypi.org/project/fuse-python/
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# The test mounts a FUSE filesystem, which the sandbox does not allow
RESTRICT="test"

DEPEND="sys-fs/fuse:0"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"
