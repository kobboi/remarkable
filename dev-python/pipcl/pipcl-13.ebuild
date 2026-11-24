# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Python packaging (PEP 517 backend) used by PyMuPDF's setup.py"
HOMEPAGE="
	https://github.com/ArtifexSoftware/pipcl
	https://pypi.org/project/pipcl/
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# pip is listed in requires_dist but pipcl only runs it as a command for
# operations a build backend doesn't use
RDEPEND="dev-python/packaging[${PYTHON_USEDEP}]"
BDEPEND="${RDEPEND}"

# the tests build and install sample projects with pip, using the network
RESTRICT="test"
