# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit optfeature python-single-r1

DESCRIPTION="Generate daily schedule PDFs for e-ink tablets from ICS calendars"
HOMEPAGE="https://github.com/rmitchellscott/ephemeris"
SRC_URI="https://github.com/rmitchellscott/ephemeris/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Ephemeris-${PV}"

# bundled Montserrat fonts
LICENSE="GPL-3 OFL-1.1"
SLOT="0"
# dev-python/loguru is not keyworded on arm64
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# pypdf is listed in requirements.txt but never imported.
# reportlab is deprecated in ::gentoo because 5.x is broken; 4.x works.
RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/icalendar[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		<dev-python/reportlab-5[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/webcolors[${PYTHON_USEDEP}]
		media-gfx/cairosvg[${PYTHON_USEDEP}]
	')
"

src_install() {
	# settings.py finds fonts/, assets/ and config.yaml relative to the
	# package directory, so keep the upstream layout together.
	insinto /usr/share/${PN}
	doins -r ephemeris fonts ephemeris.py
	insinto /usr/share/${PN}/assets
	doins assets/cover.svg
	python_optimize "${ED}"/usr/share/${PN}

	# Upstream defaults config.yaml and feeds_meta.yaml to the install
	# directory; point them at per-user locations instead.
	cat > "${T}"/${PN} <<-EOT || die
		#!/bin/sh
		: "\${APP_CONFIG_PATH:=\${XDG_CONFIG_HOME:-\${HOME}/.config}/${PN}/config.yaml}"
		: "\${APP_META_FILE_PATH:=\${XDG_STATE_HOME:-\${HOME}/.local/state}/${PN}/feeds_meta.yaml}"
		export APP_CONFIG_PATH APP_META_FILE_PATH
		mkdir -p "\$(dirname "\${APP_META_FILE_PATH}")" || exit 1
		exec ${EPREFIX}/usr/bin/${EPYTHON} ${EPREFIX}/usr/share/${PN}/ephemeris.py "\$@"
	EOT
	dobin "${T}"/${PN}

	dodoc README.md
	docinto examples
	dodoc config.yaml
	docompress -x /usr/share/doc/${PF}/examples
}

pkg_postinst() {
	optfeature "PNG and SVG output (APP_OUTPUT_FORMAT)" "app-text/poppler[cairo,utils]"

	elog "Copy /usr/share/doc/${PF}/examples/config.yaml to"
	elog "~/.config/ephemeris/config.yaml and list your calendars there."
	elog "Everything else is set through environment variables (TZ,"
	elog "TIME_DATE_RANGE, APP_OUTPUT_PDF_PATH, ...); see the README."
	elog "The PDF is written to ./output/ephemeris.pdf by default. To send it"
	elog "to the tablet, set APP_POST_HOOK, for example to an rmapi command."
}
