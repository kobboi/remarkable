# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg

APP_ID="dev.schneider.remarkableremember"
MY_PN="reMarkableRemember"
EXE="ReMarkableRemember"
REL_URI="https://github.com/ds160/remarkable-remember/releases/download/${PV}"

DESCRIPTION="Offline backup, sync, template and handwriting manager for reMarkable (prebuilt)"
HOMEPAGE="https://github.com/ds160/remarkable-remember"
SRC_URI="
	amd64? ( ${REL_URI}/${MY_PN}-linux-x64.deb -> ${P}-amd64.deb )
	arm64? ( ${REL_URI}/${MY_PN}-linux-arm64.deb -> ${P}-arm64.deb )
"
S="${WORKDIR}"

LICENSE="MIT"
# Bundled self-contained .NET runtime, Avalonia, SkiaSharp, SQLite, BouncyCastle
LICENSE+=" Apache-2.0 BSD public-domain"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="strip"

# Self-contained .NET app; these are dlopen()ed at runtime
RDEPEND="
	dev-libs/icu
	dev-libs/openssl
	media-libs/fontconfig
	media-libs/libglvnd
	virtual/zlib
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrandr
"

QA_PREBUILT="opt/${APP_ID}/*"

src_prepare() {
	default
	# LTTng tracing provider: optional, and would drag in dev-util/lttng-ust
	rm opt/${APP_ID}/libcoreclrtraceptprovider.so || die
	sed -i -e "s|^Exec=.*|Exec=${EXE}|" -e "s|^TryExec=.*|TryExec=${EXE}|" \
		usr/share/applications/${APP_ID}.desktop || die
}

src_install() {
	insinto /opt
	doins -r opt/${APP_ID}
	fperms 0755 /opt/${APP_ID}/${EXE} /opt/${APP_ID}/createdump
	find "${ED}"/opt/${APP_ID} -name '*.so' -exec chmod 0755 {} + || die
	dosym -r /opt/${APP_ID}/${EXE} /usr/bin/${EXE}

	insinto /usr/share
	doins -r usr/share/applications usr/share/icons usr/share/metainfo
}
