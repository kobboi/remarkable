# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYPI_PN="remarkable_mouse"
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Use a reMarkable tablet as a mouse or graphics tablet over SSH"
HOMEPAGE="
	https://github.com/evidlo/remarkable_mouse
	https://pypi.org/project/remarkable-mouse/
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# dev-python/pynput and dev-python/screeninfo come from ::guru
RDEPEND="
	dev-python/libevdev[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/pynput[${PYTHON_USEDEP}]
	dev-python/screeninfo[${PYTHON_USEDEP}]
"

pkg_postinst() {
	elog "The default mode moves the X11 pointer through pynput."
	elog "For pressure/tilt support (Krita, GIMP, Xournal++), run"
	elog "  remouse --evdev"
	elog "which needs write access to /dev/uinput (root, or a udev rule"
	elog "granting your user access to the uinput device)."
}
