# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

MY_PN="reStream"

DESCRIPTION="Stream the reMarkable tablet screen to your computer over SSH"
HOMEPAGE="https://github.com/rien/reStream"
SRC_URI="
	https://github.com/rien/reStream/releases/download/v${PV}/${MY_PN}.sh -> ${P}.sh
	https://github.com/rien/reStream/releases/download/v${PV}/restream.arm.static -> ${P}.arm.static
"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	app-arch/lz4
	media-video/ffmpeg[sdl]
	virtual/openssh
"

# restream.arm.static is a prebuilt binary for the tablet, not the host
QA_PREBUILT="usr/share/${PN}/restream"

src_unpack() {
	cp "${DISTDIR}"/${P}.sh "${DISTDIR}"/${P}.arm.static "${S}"/ || die
}

src_install() {
	newbin ${P}.sh ${PN}
	dosym ${PN} /usr/bin/${MY_PN}

	insinto /usr/share/${PN}
	newins ${P}.arm.static restream
	fperms 0755 /usr/share/${PN}/restream
	dostrip -x /usr/share/${PN}/restream
}

pkg_postinst() {
	elog "The tablet side of reStream must be installed on the reMarkable."
	elog "Copy the bundled ARMv7 binary to it with:"
	elog "  scp ${EROOT}/usr/share/${PN}/restream root@10.11.99.1:/home/root/restream"
	elog
	optfeature "throughput measurement (restream --measure)" sys-apps/pv
	optfeature "unencrypted fast transfer (restream --unsecure-connection)" net-analyzer/netcat net-analyzer/openbsd-netcat
	optfeature "v4l2 webcam output (restream --webcam)" media-video/v4l2loopback
}
