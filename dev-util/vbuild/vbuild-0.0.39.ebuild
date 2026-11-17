# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Build tool for Vellum (VELBUILD) packages for reMarkable tablets"
HOMEPAGE="
	https://github.com/Eeems/vbuild
	https://vellum.delivery/
"
# Not on PyPI ("vbuild" there is an unrelated project)
SRC_URI="https://github.com/Eeems/vbuild/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
# dev-python/podman is amd64-only
KEYWORDS="~amd64"
# The test suite builds packages in containers
RESTRICT="test"

# vbuild runs abuild inside the ghcr.io/eeems/vbuild-builder container
# image (pulled on first use), so it needs a container runtime and network
# access at run time.  It imports both client libraries unconditionally.
RDEPEND="
	app-shells/bash
	dev-libs/openssl
	dev-python/docker[${PYTHON_USEDEP}]
	dev-python/podman[${PYTHON_USEDEP}]
	dev-python/pyelftools[${PYTHON_USEDEP}]
	dev-python/rich-argparse[${PYTHON_USEDEP}]
	|| (
		app-containers/podman
		app-containers/docker
	)
"

src_prepare() {
	distutils-r1_src_prepare
	# Upstream compiles vbuild with Nuitka.  As plain Python, the cli
	# subpackage must be listed too: the uncompiled code finds the
	# subcommands by globbing vbuild/cli/*.py.  Also drop the == pins.
	sed -i \
		-e 's/build-backend = "nuitka.distutils.Build"/build-backend = "setuptools.build_meta"/' \
		-e 's/, *"nuitka[^"]*"//' \
		-e 's/^packages = \["vbuild"\]/packages = ["vbuild", "vbuild.cli"]/' \
		-e '/^dependencies/,/^]/s/==/>=/' \
		pyproject.toml || die
}
