# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT="10.0"
# Full restore set of src/ReMarkableRemember for linux-x64 and linux-arm64,
# minus the .NET runtime/host packs, which dev-dotnet/dotnet-runtime-nugets
# provides. Regenerate by running "dotnet restore -r <rid>" on that project
# into an empty NUGET_PACKAGES directory and listing <id>@<version>.
NUGETS="
avalonia.angle.windows.natives@2.1.27548.20260419
avalonia.buildservices@11.3.2
avalonia.desktop@12.1.1
avalonia.fonts.inter@12.1.1
avalonia.freedesktop.atspi@12.1.1
avalonia.freedesktop@12.1.1
avalonia.harfbuzz@12.1.1
avalonia.native@12.1.1
avalonia.remote.protocol@12.1.1
avalonia.skia@12.1.1
avalonia.themes.fluent@12.1.1
avalonia.win32@12.1.1
avalonia.x11@12.1.1
avalonia@12.1.1
bouncycastle.cryptography@2.7.0
dynamicdata@9.4.31
excss@4.3.1
harfbuzzsharp.nativeassets.linux@8.3.1.3
harfbuzzsharp.nativeassets.macos@8.3.1.3
harfbuzzsharp.nativeassets.webassembly@8.3.1.3
harfbuzzsharp.nativeassets.win32@8.3.1.3
harfbuzzsharp@8.3.1.3
humanizer.core@2.14.1
microcom.runtime@0.11.6
microsoft.build.framework@17.11.31
microsoft.build.framework@18.0.2
microsoft.codeanalysis.analyzers@3.11.0
microsoft.codeanalysis.common@5.0.0
microsoft.codeanalysis.csharp.workspaces@5.0.0
microsoft.codeanalysis.csharp@5.0.0
microsoft.codeanalysis.workspaces.common@5.0.0
microsoft.codeanalysis.workspaces.msbuild@5.0.0
microsoft.data.sqlite.core@10.0.11
microsoft.entityframeworkcore.abstractions@10.0.11
microsoft.entityframeworkcore.analyzers@10.0.11
microsoft.entityframeworkcore.design@10.0.11
microsoft.entityframeworkcore.relational@10.0.11
microsoft.entityframeworkcore.sqlite.core@10.0.11
microsoft.entityframeworkcore.sqlite@10.0.11
microsoft.entityframeworkcore@10.0.11
microsoft.extensions.caching.abstractions@10.0.11
microsoft.extensions.caching.memory@10.0.11
microsoft.extensions.configuration.abstractions@10.0.11
microsoft.extensions.dependencyinjection.abstractions@10.0.11
microsoft.extensions.dependencyinjection.abstractions@8.0.2
microsoft.extensions.dependencyinjection.abstractions@9.0.0
microsoft.extensions.dependencyinjection@10.0.11
microsoft.extensions.dependencyinjection@9.0.0
microsoft.extensions.dependencymodel@10.0.11
microsoft.extensions.logging.abstractions@10.0.11
microsoft.extensions.logging.abstractions@8.0.3
microsoft.extensions.logging.abstractions@9.0.0
microsoft.extensions.logging@10.0.11
microsoft.extensions.logging@9.0.0
microsoft.extensions.options@10.0.11
microsoft.extensions.options@9.0.0
microsoft.extensions.primitives@10.0.11
microsoft.extensions.primitives@9.0.0
microsoft.visualstudio.solutionpersistence@1.0.52
mono.texttemplating@3.0.0
newtonsoft.json@13.0.3
newtonsoft.json@13.0.4
prodatagrid.formulaengine.excel@12.1.0.4
prodatagrid.formulaengine@12.1.0.4
prodatagrid@12.1.0.4
reactiveui.avalonia@12.0.3
reactiveui@23.2.28
shimskiasharp@5.2.1
skiasharp.nativeassets.linux@3.119.4
skiasharp.nativeassets.macos@3.119.4
skiasharp.nativeassets.webassembly@3.119.4
skiasharp.nativeassets.win32@3.119.4
skiasharp@3.119.4
splat.builder@19.4.1
splat.core@19.4.1
splat.logging@19.4.1
splat@19.4.1
sqlitepclraw.bundle_e_sqlite3@2.1.12
sqlitepclraw.core@2.1.12
sqlitepclraw.lib.e_sqlite3@2.1.12
sqlitepclraw.provider.e_sqlite3@2.1.12
ssh.net@2026.0.0
svg.controls.avalonia@12.0.0.15
svg.custom@5.2.1
svg.model@5.2.1
svg.scenegraph@5.2.1
system.codedom@6.0.0
system.composition.attributedmodel@9.0.0
system.composition.convention@9.0.0
system.composition.hosting@9.0.0
system.composition.runtime@9.0.0
system.composition.typedparts@9.0.0
system.composition@9.0.0
system.reactive@6.1.0
tmds.dbus.protocol@0.94.1
"

inherit dotnet-pkg desktop xdg

APP_ID="dev.schneider.remarkableremember"

DESCRIPTION="Offline backup, sync, template and handwriting manager for reMarkable"
HOMEPAGE="https://github.com/ds160/remarkable-remember"
SRC_URI="
	https://github.com/ds160/remarkable-remember/archive/refs/tags/${PV}.tar.gz
		-> ${P}.gh.tar.gz
	${NUGET_URIS}
"

LICENSE="MIT"
# NuGet dependencies, e.g. Avalonia, SkiaSharp, SSH.NET, BouncyCastle, SQLite
LICENSE+=" Apache-2.0 BSD public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# SkiaSharp, HarfBuzzSharp and e_sqlite3 come as prebuilt native libraries in
# their NuGet packages; Avalonia dlopen()s the X11 and GL libraries.
RDEPEND="
	media-libs/fontconfig
	media-libs/libglvnd
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrandr
"

DOTNET_PKG_PROJECTS=( src/ReMarkableRemember/ReMarkableRemember.csproj )

src_prepare() {
	# The solution also pulls in the test projects, whose NuGet packages
	# (NUnit, Moq, FluentAssertions, ...) are not in NUGETS
	rm ReMarkableRemember.slnx || die
	dotnet-pkg_src_prepare
}

src_install() {
	dotnet-pkg-base_install
	dotnet-pkg-base_dolauncher /usr/share/${P}/ReMarkableRemember reMarkableRemember

	# Upstream's packaging tool (pupnet) generates the desktop entry; ship an
	# equivalent one and install the icons and AppStream data it would use.
	domenu "${FILESDIR}"/${APP_ID}.desktop
	local size
	for size in 16 24 32 48 64 96 128 256 512; do
		newicon -s ${size} assets/deployment/linux.${size}x${size}.png ${APP_ID}.png
	done
	insinto /usr/share/metainfo
	newins assets/deployment/linux.metainfo.xml ${APP_ID}.metainfo.xml

	einstalldocs
}
