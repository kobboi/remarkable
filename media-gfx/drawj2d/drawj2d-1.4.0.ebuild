# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2 java-pkg-simple

MY_P="Drawj2d-${PV}"

DESCRIPTION="Technical drawings from a Tcl-like language, with reMarkable .rm/.rmdoc output"
HOMEPAGE="https://drawj2d.sourceforge.io/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${PV}/${MY_P}.src.tar.gz"
S="${WORKDIR}/Drawj2d"

# drawj2d: GPL-3; bundled libraries under src/: FreeHEP (Apache-2.0 or
# LGPL-2.1), Hecl and jtar (Apache-2.0), svgSalamander and JBig2 (BSD),
# EpsGraphics and JLaTeXMath (GPL-2), OrsonPDF and JFreeSVG (GPL-3),
# java-getopt (LGPL-2), PDFRenderer, JTikZ, yacas and G-geometry
# (LGPL-2.1+), EvalEx (MIT), JLaTeXMath's fonts (TeX-other-free).
# TCL DXF (ru/tcl) only carries a warranty disclaimer.
LICENSE="GPL-3 Apache-2.0 BSD GPL-2 LGPL-2 LGPL-2.1+ MIT TeX-other-free"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND=">=virtual/jdk-1.8:*"
RDEPEND=">=virtual/jre-1.8:*"

JAVA_MAIN_CLASS="net.sf.drawj2d.Drawj2d"
JAVA_SRC_DIR="src"
JAVA_RESOURCE_DIRS="res"

src_prepare() {
	java-pkg-2_src_prepare
	# Resources (fonts, ICC profiles, service files, message bundles) sit
	# next to the sources; build.xml copies everything but *.java.
	mkdir res || die
	cd src || die
	find . -type f ! -name '*.java' -exec cp --parents -t ../res {} + || die
}

src_install() {
	java-pkg-simple_src_install
	doman resources/manpage/${PN}.1
	dodoc resources/docs/{Drawj2d_en,wiki_reMarkable}.pdf
}
