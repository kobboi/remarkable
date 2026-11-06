# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

# Prebuilt: the server embeds a web UI that is built with pnpm, which is not
# packaged in ::gentoo, so it cannot be built offline in an ebuild.

DESCRIPTION="Self-hosted replacement for the reMarkable cloud (prebuilt binary)"
HOMEPAGE="
	https://github.com/ddvk/rmfakecloud
	https://ddvk.github.io/rmfakecloud/
"
BASE_URI="https://github.com/ddvk/rmfakecloud/releases/download/v${PV}"
SRC_URI="
	amd64? ( ${BASE_URI}/rmfakecloud-x64 -> ${P}-x64 )
	arm? ( ${BASE_URI}/rmfakecloud-armv7 -> ${P}-armv7 )
	arm64? ( ${BASE_URI}/rmfakecloud-arm64 -> ${P}-arm64 )
"
S="${WORKDIR}"

LICENSE="AGPL-3"
# Bundled Go modules and the embedded web UI
LICENSE+=" Apache-2.0 BSD ISC MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm ~arm64"
# Static Go binary
RESTRICT="strip"

# acct-* are needed at build time too, for fowners in src_install
DEPEND="
	acct-group/rmfakecloud
	acct-user/rmfakecloud
"
RDEPEND="${DEPEND}"

QA_PREBUILT="usr/bin/rmfakecloud"

src_unpack() {
	# A single bare executable for the selected arch
	cp "${DISTDIR}"/${A} "${S}"/rmfakecloud || die
}

src_install() {
	dobin rmfakecloud

	insinto /etc
	newins "${FILESDIR}"/rmfakecloud.conf rmfakecloud.conf
	# Holds JWT_SECRET_KEY and possibly SMTP credentials
	fperms 0640 /etc/rmfakecloud.conf
	fowners root:rmfakecloud /etc/rmfakecloud.conf

	newinitd "${FILESDIR}"/rmfakecloud.initd rmfakecloud
	systemd_dounit "${FILESDIR}"/rmfakecloud.service

	keepdir /var/lib/rmfakecloud /var/log/rmfakecloud
	fowners rmfakecloud:rmfakecloud /var/lib/rmfakecloud /var/log/rmfakecloud
	fperms 0750 /var/lib/rmfakecloud
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog "Set JWT_SECRET_KEY and STORAGE_URL in /etc/rmfakecloud.conf, then"
		elog "create an admin user (run as rmfakecloud with DATADIR set):"
		elog "  rmfakecloud setuser -u <name> -a"
		elog "The tablet itself needs rmfakecloud-proxy (e.g. from toltec) to"
		elog "redirect its cloud traffic here; see"
		elog "  https://ddvk.github.io/rmfakecloud/remarkable/setup/"
	fi
}
