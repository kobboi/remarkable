# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Generated from upstream's Cargo.lock
CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	aho-corasick@1.1.3
	anstream@0.6.18
	anstyle@1.0.10
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anyhow@1.0.93
	backtrace@0.3.74
	cfg-if@1.0.0
	clap@4.5.21
	clap_builder@4.5.21
	clap_derive@4.5.18
	clap_lex@0.7.3
	colorchoice@1.0.3
	file-id@0.2.3
	gimli@0.31.1
	heck@0.5.0
	is_terminal_polyfill@1.70.1
	lazy_static@1.5.0
	libc@0.2.164
	memchr@2.7.4
	miniz_oxide@0.8.0
	object@0.36.5
	proc-macro2@1.0.89
	quote@1.0.37
	regex@1.11.1
	regex-automata@0.4.9
	regex-syntax@0.8.5
	rustc-demangle@0.1.24
	strsim@0.11.1
	syn@2.0.87
	unicode-ident@1.0.13
	utf8parse@0.2.2
	windows-link@0.2.1
	windows-sys@0.59.0
	windows-sys@0.60.2
	windows-targets@0.52.6
	windows-targets@0.53.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.1
"

inherit cargo

# Upstream has no releases or tags; this is a snapshot of master
COMMIT="fceacdd79e5cda2333a8a408bbde49901786aea5"

DESCRIPTION="Create, hash and apply QMD diffs that patch reMarkable's QML (xovi mods)"
HOMEPAGE="https://github.com/asivery/qmldiff"
SRC_URI="
	https://github.com/asivery/qmldiff/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+=" MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_install() {
	# Cargo.toml also builds a staticlib (the form xovi's
	# qt-resource-rebuilder links on the tablet); only the CLI is useful
	# on the host
	cargo_src_install
	dodoc README.MD
	dodoc -r docs/.
}
