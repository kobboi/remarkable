# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 edo pypi

MUPDF_P="mupdf-${PV}-source"

DESCRIPTION="Python bindings for MuPDF: read, render, search and edit PDF and other documents"
HOMEPAGE="
	https://pymupdf.readthedocs.io/
	https://github.com/pymupdf/PyMuPDF
	https://pypi.org/project/PyMuPDF/
"
# PyMuPDF needs MuPDF's C++ and Python (SWIG) bindings, which
# app-text/mupdf doesn't build; they are generated here from the matching
# MuPDF source and linked against the system libmupdf.
SRC_URI+=" https://mupdf.com/downloads/archive/${MUPDF_P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# The bindings are generated from the headers, so MuPDF must be the same
# X.Y release.
DEPEND="=app-text/mupdf-$(ver_cut 1-2)*:="
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/swig
	dev-python/pipcl[${PYTHON_USEDEP}]
	$(python_gen_any_dep 'dev-python/clang[${PYTHON_USEDEP}]')
"

# The test suite pip-installs its own requirements (pymupdf-fonts, pylint,
# mypy, ...) from conftest.py.
RESTRICT="test"

# MuPDF's binding generator puts its own -O2 on the command lines
QA_FLAGS_IGNORED=".*/pymupdf/(_mupdf|libmupdfcpp)\.so.*"

python_check_deps() {
	python_has_version "dev-python/clang[${PYTHON_USEDEP}]"
}

src_prepare() {
	distutils-r1_src_prepare
	# mupdfwrap re-runs itself in a fresh venv, which doesn't see the
	# system's clang bindings or pipcl; run it with the system Python.
	sed -i -e 's/^autovenv\.enter()$/pass/' \
		"${WORKDIR}/${MUPDF_P}"/scripts/wrap/__main__.py || die
	grep -q '^autovenv\.enter()' "${WORKDIR}/${MUPDF_P}"/scripts/wrap/__main__.py &&
		die "autovenv sed failed"
}

src_compile() {
	# Build the C++ and Python bindings once, against the system libmupdf
	# and for Python's stable ABI (set by the build directory name). 3.11 is
	# the oldest stable ABI with the buffer protocol that Python 3.13+ needs.
	local build=build/shared-release-Py_LIMITED_API_0x030b0000
	mkdir -p "${WORKDIR}/${MUPDF_P}/${build}" || die
	ln -s "${ESYSROOT}/usr/$(get_libdir)/libmupdf.so" \
		"${WORKDIR}/${MUPDF_P}/${build}/libmupdf.so" || die
	(
		python_setup
		cd "${WORKDIR}/${MUPDF_P}" || die
		# 0, 1: generate and build libmupdfcpp; 2, 3: generate and build
		# the SWIG module _mupdf.so.
		edo "${EPYTHON}" scripts/mupdfwrap.py -d ${build} -b 0123
	)
	MUPDF_BUILD="${WORKDIR}/${MUPDF_P}/${build}"

	distutils-r1_src_compile
}

python_compile() {
	# PyMuPDF's own extension, against the bindings built above
	local -x PYMUPDF_SETUP_MUPDF_BUILD=
	local -x PYMUPDF_SETUP_MUPDF_THIRD=0
	local -x PYMUPDF_INCLUDES="${WORKDIR}/${MUPDF_P}/include:${WORKDIR}/${MUPDF_P}/platform/c++/include"
	local -x PYMUPDF_MUPDF_LIB="${MUPDF_BUILD}"
	distutils-r1_python_compile
}

python_install() {
	distutils-r1_python_install
	# The bindings go next to PyMuPDF, which imports them as pymupdf.mupdf;
	# all three libraries carry a $ORIGIN runpath (pipcl adds it to
	# _extra.so).
	python_moduleinto pymupdf
	python_domodule "${MUPDF_BUILD}"/{mupdf.py,_mupdf.so,libmupdfcpp.so.$(ver_cut 2-3)}
}
