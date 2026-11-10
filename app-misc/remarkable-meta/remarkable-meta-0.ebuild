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
IUSE="+cloud +convert dev firmware gui mouse news +screenshot server +stream +sync"

# amd64-only members: rm-exporter-bin (upstream only publishes an x86_64
# Linux build), goosepaper (weasyprint/readability-lxml are not keyworded
# on arm64), and codexctl and vbuild (indexed-gzip and podman are
# amd64-only).  The SDK is left out: it needs a device USE flag and is
# several GB per device.
RDEPEND="
	cloud? ( net-misc/rmapi )
	convert? ( app-text/rmc )
	dev? (
		dev-util/qmldiff
		amd64? ( dev-util/vbuild )
	)
	firmware? ( amd64? ( app-misc/codexctl ) )
	gui? (
		app-misc/remanager
		app-misc/remarkable-remember
		amd64? ( app-misc/rm-exporter-bin )
	)
	mouse? (
		x11-misc/remarkable-mouse
		x11-misc/remarkable-tablet-driver
	)
	news? ( amd64? ( app-text/goosepaper ) )
	screenshot? ( media-gfx/resnap )
	server? ( net-misc/rmfakecloud )
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
