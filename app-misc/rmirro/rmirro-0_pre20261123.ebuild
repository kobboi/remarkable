# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit python-single-r1

# Upstream makes no releases; package a snapshot of the default branch
COMMIT="2556c0359946fca81e6dd0cf3c033b73e29b1f9c"

DESCRIPTION="Two-way sync between a reMarkable tablet and a local folder, without the cloud"
HOMEPAGE="https://github.com/hersle/rmirro"
SRC_URI="https://github.com/hersle/rmirro/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	net-misc/rsync
	virtual/openssh
"

src_install() {
	# rmirro looks up its renderer scripts next to itself (via __file__),
	# so keep everything together and expose a wrapper in PATH.
	insinto /usr/share/${PN}
	exeinto /usr/share/${PN}
	doexe rmirro.py render_*.py
	python_fix_shebang "${ED}"/usr/share/${PN}
	dosym ../share/${PN}/rmirro.py /usr/bin/rmirro

	dodoc README.md

	# udev helper scripts hardcode paths for a manual install; ship them as
	# documentation instead of activating them.
	docinto examples
	dodoc rm_sync_on_connect_*.sh
	docompress -x /usr/share/doc/${PF}/examples
}

pkg_postinst() {
	elog "rmirro needs passwordless SSH access to the tablet as 'ssh remarkable'"
	elog "(configure a Host entry in ~/.ssh/config)."
	elog "The default renderer (render_usb.py) needs the tablet's USB web interface"
	elog "enabled under Settings > Storage."
	elog "Sync-on-connect udev examples: /usr/share/doc/${PF}/examples"
}
