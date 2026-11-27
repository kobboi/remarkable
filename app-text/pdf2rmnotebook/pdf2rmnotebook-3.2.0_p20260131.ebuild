# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

# Untagged snapshot after v3.2.0 (the script calls itself 3.2.2): stricter
# error handling, dependency checks, lowercase UUIDs, and more examples.
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
	dodoc README.md TODO.md
	docinto examples
	dodoc example/*.{hcl,pdf,png,jpg}
	docompress -x /usr/share/doc/${PF}/examples
}

pkg_postinst() {
	optfeature "converting text files (-c)" app-text/rmc
}
