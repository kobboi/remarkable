# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop optfeature xdg

APP_ID="io.scottlabs.reManager"
RAW_URI="https://raw.githubusercontent.com/rmitchellscott/reManager/v${PV}"
REL_URI="https://github.com/rmitchellscott/reManager/releases/download/v${PV}"

DESCRIPTION="Desktop app for managing mods on reMarkable tablets via Vellum (prebuilt)"
HOMEPAGE="https://github.com/rmitchellscott/reManager"
SRC_URI="
	amd64? ( ${REL_URI}/reManager-linux-amd64.tar.gz -> ${P}-amd64.tar.gz )
	arm64? ( ${REL_URI}/reManager-linux-arm64.tar.gz -> ${P}-arm64.tar.gz )
	${RAW_URI}/flatpak/${APP_ID}.desktop -> ${P}.desktop
	${RAW_URI}/flatpak/${APP_ID}.metainfo.xml -> ${P}.metainfo.xml
	${RAW_URI}/assets/icon.svg -> ${P}.svg
"
S="${WORKDIR}"

LICENSE="GPL-3"
# Bundled Go modules and web frontend
LICENSE+=" Apache-2.0 BSD ISC MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="strip"

# Built with Wails v3 against GTK 4 / WebKitGTK 6.0
RDEPEND="
	dev-libs/glib:2
	gui-libs/gtk:4
	net-libs/libsoup:3.0
	net-libs/webkit-gtk:6
	x11-libs/libX11
"

QA_PREBUILT="usr/bin/reManager"

src_unpack() {
	unpack ${P}-${ARCH}.tar.gz
}

src_install() {
	dobin reManager

	newmenu "${DISTDIR}"/${P}.desktop ${APP_ID}.desktop
	newicon -s scalable "${DISTDIR}"/${P}.svg ${APP_ID}.svg
	insinto /usr/share/metainfo
	newins "${DISTDIR}"/${P}.metainfo.xml ${APP_ID}.metainfo.xml
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "saving device passwords (Secret Service keyring)" gnome-base/gnome-keyring
}
