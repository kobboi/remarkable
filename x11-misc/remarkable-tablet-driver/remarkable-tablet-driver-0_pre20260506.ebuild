# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake linux-info

# Upstream makes no releases; package a snapshot of the default branch
COMMIT="a0cdc7370d35e7097a42650926dd362af5fa0567"

DESCRIPTION="Use a reMarkable tablet as a pressure-sensitive pen tablet (works on Wayland)"
HOMEPAGE="https://github.com/FreeCap23/reMarkable-tablet-driver"
SRC_URI="https://github.com/FreeCap23/reMarkable-tablet-driver/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/reMarkable-tablet-driver-${COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="net-libs/libssh:="
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${P}-print-verbose.patch )

# The virtual pen device is created through /dev/uinput
CONFIG_CHECK="~INPUT_UINPUT"

pkg_postinst() {
	elog "rmTabletDriver creates a virtual pen device through /dev/uinput,"
	elog "so it needs write access there (run as root, or add a udev rule"
	elog "granting your user access to the uinput device)."
	elog "Usage: rmTabletDriver [-a 10.11.99.1] [-k ~/.ssh/id_ed25519]"
}
