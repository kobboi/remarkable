# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

# Successor of rmapy, written by the goosepaper author for goosepaper

DESCRIPTION="Python client for the reMarkable cloud API"
HOMEPAGE="
	https://github.com/j6k4m8/remarkapy
	https://pypi.org/project/remarkapy/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# httpx is deprecated in ::gentoo, but upstream has no alternative backend
RDEPEND="
	>=dev-python/crc32c-2.7.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.5.2[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
# needs credentials for the real reMarkable cloud
EPYTEST_IGNORE=( tests/test_live_readonly.py )
distutils_enable_tests pytest
