# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

MY_PN="reSnap"

DESCRIPTION="Take screenshots of a reMarkable tablet over SSH"
HOMEPAGE="https://github.com/cloudsftp/reSnap"
SRC_URI="https://github.com/cloudsftp/reSnap/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	app-arch/lz4
	media-video/ffmpeg
	virtual/openssh
"

# bin/*.arm.static are prebuilt lz4 binaries for the tablet, not the host
QA_PREBUILT="usr/share/${PN}/lz4"

src_install() {
	newbin ${MY_PN}.sh ${PN}
	dosym ${PN} /usr/bin/${MY_PN}

	insinto /usr/share/${PN}
	newins bin/lz4-1.10.0.arm.static lz4
	fperms 0755 /usr/share/${PN}/lz4
	dostrip -x /usr/share/${PN}/lz4

	dodoc README.md
}

pkg_postinst() {
	elog "For fast transfers, copy the bundled ARMv7 lz4 binary to the tablet:"
	elog "  scp ${EROOT}/usr/share/${PN}/lz4 root@10.11.99.1:/home/root/lz4"
	elog
	optfeature "showing the screenshot (default)" media-gfx/feh
	optfeature "sketch mode (resnap --sketch)" media-gfx/imagemagick
	optfeature "copying to the clipboard (resnap --clipboard)" x11-misc/xclip
}
