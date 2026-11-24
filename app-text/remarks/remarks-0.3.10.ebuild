# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

inherit optfeature python-single-r1

# Upstream makes no releases (0.3.10 is the version in pyproject.toml).
COMMIT="aeb44cce6763685f717f6de35734a53e4a3789f6"
# remarks needs its own forks of rmscene and rmc, which differ from
# dev-python/rmscene and app-text/rmc (highlight colours, list styles, a
# rewritten SVG exporter); they are installed privately, not as modules.
RMSCENE_COMMIT="0e1a31432e86571aa9e4e8eaa5f8505a55f127c3"
RMC_COMMIT="50e7ec9524af088ece67a6ba33281bc536c8f10b"

DESCRIPTION="Extract annotations and highlights from reMarkable documents to Markdown/PDF"
HOMEPAGE="https://github.com/Scrybbling-together/remarks"
SRC_URI="
	https://github.com/Scrybbling-together/remarks/archive/${COMMIT}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/scrybbling-together/rmscene/archive/${RMSCENE_COMMIT}.tar.gz
		-> ${PN}-rmscene-${RMSCENE_COMMIT:0:8}.gh.tar.gz
	https://github.com/scrybbling-together/rmc/archive/${RMC_COMMIT}.tar.gz
		-> ${PN}-rmc-${RMC_COMMIT:0:8}.gh.tar.gz
"
S="${WORKDIR}/${PN}-${COMMIT}"

# remarks: GPL-3; rmscene and rmc forks: MIT; rmc's bundled fonts: OFL-1.1
LICENSE="GPL-3 MIT OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# flask, gunicorn and sentry-sdk are only for upstream's hosted web service
# (remarks-server), which is not installed. parsita, numpy and markupsafe
# are listed in pyproject.toml but never imported.
RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/fonttools[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pymupdf[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		media-gfx/cairosvg[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	default
	rm remarks/server.py || die
}

src_install() {
	local libdir=/usr/lib/${PN}
	python_moduleinto ${libdir}
	python_domodule remarks
	python_domodule "${WORKDIR}"/rmscene-${RMSCENE_COMMIT}/src/rmscene
	python_domodule "${WORKDIR}"/rmc-${RMC_COMMIT}/src/rmc
	# the font download helper is for developers
	rm "${ED}"${libdir}/rmc/assets/fonts/download_remarkable_fonts.sh || die

	cat > "${T}"/${PN} <<-EOT || die
		#!${PYTHON}
		import sys
		sys.path.insert(0, "${EPREFIX}${libdir}")
		from remarks.__main__ import main
		sys.exit(main())
	EOT
	dobin "${T}"/${PN}

	dodoc README.md
}

pkg_postinst() {
	optfeature "better PDF rendering of typed text (otherwise CairoSVG)" \
		www-client/chromium www-client/google-chrome
}
