# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

# 3.2.2 is only a version bump inside the script; upstream's last tag is v3.2.0
COMMIT="2abf2d66d516ed9f25903902a4db11a926b285de"

DESCRIPTION="Turn PDFs and images into editable reMarkable notebooks"
HOMEPAGE="https://github.com/JCN-9000/pdf2rmnotebook"
SRC_URI="https://github.com/JCN-9000/pdf2rmnotebook/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	app-arch/zip
	app-shells/bash
	app-text/poppler[utils]
	media-gfx/drawj2d
	sys-apps/util-linux
"

src_prepare() {
	default
	# upstream looks for its templates in /var/lib or next to the script
	sed -i -e "s|^VARLIB=/var/lib/|VARLIB=${EPREFIX}/usr/share/|" \
		${PN}.sh || die
}

src_install() {
	newbin ${PN}.sh ${PN}
	insinto /usr/share/${PN}
	doins var/lib/${PN}/*
	dodoc README.md TODO.md BUGS
	docinto examples
	dodoc example/*.{hcl,pdf,png,jpg}
	docompress -x /usr/share/doc/${PF}/examples
}

pkg_postinst() {
	optfeature "converting text files (-c)" app-text/rmc
}
