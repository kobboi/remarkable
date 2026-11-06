# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info

DESCRIPTION="Meta package for host-side reMarkable tablet tools"
HOMEPAGE="https://github.com/reHackable/awesome-reMarkable"
S="${WORKDIR}"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+cloud +convert gui mouse news +screenshot server +stream +sync"

RDEPEND="
	cloud? ( net-misc/rmapi )
	convert? ( app-text/rmc )
	gui? (
		app-misc/remanager
		app-misc/remarkable-remember
		# upstream only publishes an x86_64 Linux build
		amd64? ( app-misc/rm-exporter-bin )
	)
	mouse? (
		x11-misc/remarkable-mouse
		x11-misc/remarkable-tablet-driver
	)
	# goosepaper's weasyprint/readability-lxml deps are not keyworded on arm64
	news? ( amd64? ( app-text/goosepaper ) )
	screenshot? ( media-gfx/resnap )
	server? ( net-misc/rmfakecloud-bin )
	stream? ( media-video/restream )
	sync? ( app-misc/rmirro )
"

pkg_setup() {
	# The tablet shows up as a USB network gadget at 10.11.99.1; SSH-based
	# tools (restream, resnap, rmirro, remarkable-mouse) need host-side support.
	if use mouse || use screenshot || use stream || use sync; then
		CONFIG_CHECK="~USB_USBNET ~USB_NET_CDCETHER ~USB_NET_RNDIS_HOST"
		WARNING_USB_NET_CDCETHER="CONFIG_USB_NET_CDCETHER is needed for USB networking with the tablet"
		WARNING_USB_NET_RNDIS_HOST="CONFIG_USB_NET_RNDIS_HOST is needed for USB networking with some tablet firmware"
		linux-info_pkg_setup
	fi
}
