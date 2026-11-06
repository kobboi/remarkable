# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit python-any-r1

# reMarkable's official cross toolchains: Yocto ("codex" distro) SDKs, one
# per device, each with a GCC cross compiler, Qt 6, CMake/Meson/pkg-config
# and a sysroot matching that OS release.  ${PV} is the tablet OS version;
# SDK_PV is the codex release the installers are named after.
SDK_PV="5.8.203"
# USE flag = device codename used in the installer names and in
# /opt/codex/<codename>, the path Vellum's VELBUILDs look in
DEVICES=( rm1 rm2 ferrari chiappa tatsu )

DESCRIPTION="Official reMarkable SDK (cross toolchain, Qt 6 and sysroot) for OS ${PV}"
HOMEPAGE="https://developer.remarkable.com/documentation/sdk"
BASE_URI="https://storage.googleapis.com/remarkable-codex-toolchain/${PV}"
for dev in "${DEVICES[@]}"; do
	SRC_URI+="
		${dev}? (
			amd64? ( ${BASE_URI}/remarkable-production-image-${SDK_PV}-${dev}-public-x86_64-toolchain.sh )
			arm64? ( ${BASE_URI}/remarkable-production-image-${SDK_PV}-${dev}-public-aarch64-toolchain.sh )
		)
	"
done
unset dev
S="${WORKDIR}"

# The SDK bundles GPL/LGPL toolchain parts and Qt alongside reMarkable's own
# libraries; reMarkable publishes no license terms for the bundle
LICENSE="all-rights-reserved GPL-2 GPL-3 LGPL-2.1 LGPL-3 MIT BSD"
# Each OS release has its own SDK; slots let mods target several releases
SLOT="${PV}"
KEYWORDS="-* ~amd64 ~arm64"
IUSE="${DEVICES[*]}"
REQUIRED_USE="|| ( ${DEVICES[*]} )"
# Prebuilt binaries for the host and the tablet; scanning ~60k files per
# SDK takes long and only produces QA noise
RESTRICT="bindist mirror strip binchecks"

BDEPEND="
	${PYTHON_DEPS}
	app-arch/xz-utils
	sys-apps/file
"

QA_PREBUILT="opt/codex/*"

src_unpack() {
	# The installers are shell scripts with a tar.xz payload; it is
	# extracted straight into the image in src_install
	:
}

# Mirrors what the installer does with "-d <dir>", except that files are
# written under ${ED} while every path baked into them is the final one
sdk_install() {
	local dev=${1} installer=${2}
	local dest=/opt/codex/${dev}/${SDK_PV}
	local ed=${ED}${dest}
	local build_path=/usr/local/oe-sdk-hardcoded-buildpath

	einfo "Unpacking the ${dev} SDK into ${dest}"
	mkdir -p "${ed}" || die
	local offset=$(( $(grep -na -m1 '^MARKER:$' "${installer}" | cut -d: -f1) + 1 ))
	tail -n +"${offset}" "${installer}" |
		tar -xJ -f - --no-same-owner -C "${ed}" || die "unpacking ${installer} failed"

	local native
	native=$(cd "${ed}" && echo sysroots/*-codexsdk-linux) || die
	[[ -d ${ed}/${native} ]] || die "no native sysroot in ${installer}"

	# post-relocate-setup.d writes CMake/Meson cross files from templates,
	# using the environment.  Run it against the staged tree, then point
	# the generated files at the final location.
	einfo "Generating CMake and Meson cross files"
	local env_script
	for env_script in "${ed}"/environment-setup-*; do
		(
			sed -e "s:${build_path}:${ed}:g" "${env_script}" > "${T}/env-${dev}" || die
			source "${T}/env-${dev}" || die
			local s
			for s in "${ed}/${native}"/post-relocate-setup.d/*; do
				[[ -x ${s} ]] || continue
				"${EPYTHON}" "${s}" "${ed}" || die "${s##*/} failed"
			done
		) || die
	done
	grep -rlF "${ed}" "${ed}/${native}"/usr/share/{cmake,meson} |
		xargs -r sed -i -e "s:${ed}:${dest}:g" || die

	sed -i -e "s:${build_path}:${dest}:g" "${ed}"/environment-setup-* || die

	# Point the ELF interpreter and ld.so search paths of the host tools
	# at the final location
	einfo "Relocating host binaries"
	local dl_path
	dl_path=$(cd "${ed}/${native}/lib" && echo ld-linux*) || die
	find "${ed}/${native}" -type f \
		\( -perm -0100 -o -perm -0010 -o -perm -0001 \) -print0 |
		xargs -0 -n 500 "${EPYTHON}" "${ed}"/relocate_sdk.py \
			"${dest}" "${dest}/${native}/lib/${dl_path}" ||
		die "relocate_sdk.py failed"

	# Same prefix substitution in text files (scripts, .pc, cmake configs),
	# using the host's perl like the installer does
	einfo "Fixing paths in text files"
	{
		find "${ed}" -maxdepth 1 -type f -print0
		find "${ed}/${native}" -type f -print0
	} | xargs -0 file -N -0 |
		awk -v RS='\n' -F'\0' '$2 ~ /(ASCII|script|source).*text/ { printf "%s\0", $1 }' |
		grep -zFv -e "${ed}/environment-setup-" -e "${ed}/relocate_sdk" -e "${ed}/post-relocate-setup" |
		xargs -0 -r -n 200 sed -i \
			-e "s:${build_path}:${dest}:g" \
			-e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
			-e "s: /usr/bin/perl: /usr/bin/env perl:g" ||
		die "fixing text files failed"

	local link target
	while IFS= read -r -d '' link; do
		target=$(readlink "${link}") || die
		[[ ${target} == *${build_path}* ]] &&
			{ ln -sfn "${target//${build_path}/${dest}}" "${link}" || die; }
	done < <(find "${ed}/${native}" -type l -print0)

	rm -r "${ed}"/relocate_sdk.py "${ed}"/post-relocate-setup.sh \
		"${ed}/${native}"/post-relocate-setup.d || die
}

src_install() {
	local dev host
	use amd64 && host=x86_64
	use arm64 && host=aarch64
	for dev in "${DEVICES[@]}"; do
		use "${dev}" || continue
		sdk_install "${dev}" \
			"${DISTDIR}/remarkable-production-image-${SDK_PV}-${dev}-public-${host}-toolchain.sh"
	done
}

pkg_postinst() {
	local dev
	elog "To build for the tablet, source the SDK environment in a shell:"
	for dev in "${DEVICES[@]}"; do
		use "${dev}" || continue
		elog "  . ${EROOT}/opt/codex/${dev}/${SDK_PV}/environment-setup-*"
	done
	elog "This sets CC, CXX, PKG_CONFIG_*, CMAKE_TOOLCHAIN_FILE and puts qmake6"
	elog "on PATH.  Binaries built with it only run on OS ${PV}-compatible"
	elog "firmware; see https://developer.remarkable.com/documentation/sdk"
}
