# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit cmake distutils-r1

# The C++ library librm_lines and its ctypes bindings live in one repo; PyPI
# only has prebuilt wheels. The library is not versioned and is only loaded
# by the bindings, which look for it next to themselves, so it is installed
# into the Python module rather than into libdir.
MY_PN=librm_lines
MY_P=${MY_PN}-${PV}

DESCRIPTION="Library for reading and rendering reMarkable .rm files, with Python bindings"
HOMEPAGE="
	https://github.com/RedTTGMoss/librm_lines
	https://pypi.org/project/rm-lines-sys/
"
SRC_URI="
	https://github.com/RedTTGMoss/${MY_PN}/archive/refs/tags/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
CMAKE_USE_DIR="${WORKDIR}/${MY_P}"
S="${CMAKE_USE_DIR}/rm_lines_sys"

# librm_lines: Apache-2.0 plus an attribution clause; embedded Karla and
# Libre Baskerville fonts: OFL-1.1; stb: MIT or Unlicense. The embedded
# reMarkableSymbols font carries no licence; upstream treats it as free.
LICENSE="LIB-rMLines-1.0 OFL-1.1 || ( MIT Unlicense )"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	dev-cpp/nlohmann_json
	dev-cpp/simdutf:=
	dev-libs/utfcpp
	media-libs/freetype:2
	media-libs/harfbuzz:=
"
RDEPEND="${DEPEND}"
# fonttools splits the variable fonts into the static weights that get
# embedded in the library
BDEPEND="
	$(python_gen_any_dep 'dev-python/fonttools[${PYTHON_USEDEP}]')
"

python_check_deps() {
	python_has_version "dev-python/fonttools[${PYTHON_USEDEP}]"
}

src_prepare() {
	# the patch is relative to the repo root, not to ${S}
	pushd "${CMAKE_USE_DIR}" >/dev/null || die
	eapply "${FILESDIR}"/${P}-system-libs.patch
	cmake_prepare
	popd >/dev/null || die

	sed -i -e "s/0.0.0+replaced-by-ci/${PV}/" pyproject.toml || die
	# upstream CI copies these in before building the wheel
	cp "${CMAKE_USE_DIR}"/{LICENSE,THIRD-PARTY-NOTICES}.md . || die
	distutils-r1_src_prepare
}

src_configure() {
	python_setup
	local mycmakeargs=(
		-DPython3_EXECUTABLE="${PYTHON}"
	)
	BUILD_DIR="${WORKDIR}"/cmake_build cmake_src_configure
	distutils-r1_src_configure
}

src_compile() {
	# only the library; the test programs are built with AddressSanitizer
	BUILD_DIR="${WORKDIR}"/cmake_build cmake_src_compile rm_lines
	cp "${WORKDIR}"/cmake_build/librm_lines.so src/rm_lines_sys/ || die
	distutils-r1_src_compile
}

python_test() {
	"${EPYTHON}" -c '
import rm_lines_sys
assert rm_lines_sys.lib is not None, "librm_lines.so failed to load"
' || die "load test failed with ${EPYTHON}"
}

src_install() {
	distutils-r1_src_install
	dodoc "${CMAKE_USE_DIR}"/{README,THIRD-PARTY-NOTICES}.md
}
