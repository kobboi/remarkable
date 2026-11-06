# remarkable overlay

Gentoo ebuild repository for host-side tools that work with the
[reMarkable](https://remarkable.com) paper tablets.

## Packages

| Package | Version | What it does |
|---|---|---|
| `dev-python/rmscene` | 0.8.0 | Library for reading and writing v6 `.rm` notebook files |
| `app-text/rmc` | 0.3.1_pre20260405 | Convert `.rm` files to SVG/PDF/Markdown (PDF export needs Inkscape) |
| `net-misc/rmapi` | 0.0.35 | CLI and shell for the reMarkable cloud (ddvk fork, built from source) |
| `net-misc/rmfakecloud-bin` | 0.0.32 | Self-hosted cloud replacement, with OpenRC and systemd services |
| `x11-misc/remarkable-mouse` | 7.2.0 | Use the tablet as a mouse or pen tablet over SSH |
| `media-video/restream` | 1.5.0 | Stream the tablet screen to an ffplay window |
| `app-misc/rmirro` | 0_pre20250112 | Two-way sync between the tablet and a local folder, without the cloud |
| `app-misc/remanager` | 2.0.0 | Desktop app for installing and managing tablet mods via Vellum (all models incl. Paper Pro) |
| `app-misc/remarkable-remember` | 1.10.0 | Offline backup, PDF/EPUB upload, templates and handwriting recognition GUI |
| `app-misc/rm-exporter-bin` | 0.3.0 | Export whole folders and large notebooks to PDF over USB (amd64 only) |
| `media-gfx/resnap` | 2.5.3 | Screenshot the tablet over SSH |
| `x11-misc/remarkable-tablet-driver` | 0_pre20260506 | Pen tablet driver using uinput, so it works on Wayland too |
| `dev-python/remarkapy` | 0.3.1 | Python client for the reMarkable cloud |
| `app-text/goosepaper` | 0.8.1 | Build daily newspapers from RSS/Wikipedia and send them to the tablet (amd64 only) |
| `app-misc/remarkable-meta` | 0 | Meta package that pulls in the tools above by USE flag |
| `acct-{user,group}/rmfakecloud` | 0 | Service account for rmfakecloud |

## Setup

This overlay uses **::guru** as a master: `remarkable-mouse` needs
`dev-python/pynput` and `dev-python/screeninfo` from it, and `goosepaper`
needs `dev-python/EbookLib` and `dev-python/readability-lxml`.

```
# /etc/portage/repos.conf/remarkable.conf
[remarkable]
location = /home/christophe/remarkable
auto-sync = no
```

```
emerge -av app-misc/remarkable-meta
```

Packages are keyworded `~amd64 ~arm64`, except `rm-exporter-bin` and
`goosepaper` (`~amd64` only) and `rmfakecloud-bin` (also `~arm`).

`remanager-bin` and `remarkable-remember-bin` were replaced by
source-built packages; `profiles/updates` moves existing installs over.

## Packaging notes

* **rmc** uses a git snapshot because the 0.3.0 release pins `rmscene<0.7`,
  which can't read files from current tablet firmware.
* **rmscene** relaxes upstream's arbitrary `packaging ^23` cap.
* **rmapi** uses `EGO_SUM`. pkgcheck flags it as deprecated, but there is
  nowhere to host a vendor tarball. Its Go modules are fetched straight from
  proxy.golang.org, because the eclass's `mirror://goproxy//` URIs make
  goproxy.io return HTML pages for `golang.org/x/*` modules.
* **remanager** is built from source: Go modules via `EGO_SUM`, and every
  npm tarball of its frontend as a distfile (named `*.tgz.npm` so `unpack`
  skips them), fed to a private offline npm cache. The Wails v3 fork that
  upstream patches is rebuilt from the proxy.golang.org module zip.
  Vite's native helpers (esbuild, rollup, lightningcss, tailwind oxide) are
  the upstream prebuilt npm packages.
* **remarkable-remember** is built from source with the `dotnet-pkg`
  eclass and runs on the system .NET 10 runtime
  (`dev-dotnet/dotnet-sdk-bin:10.0` at build time). SkiaSharp, HarfBuzzSharp
  and SQLite native libraries still come prebuilt inside their NuGet packages.
* **rm-exporter** and **rmfakecloud** stay binary for now: rm-exporter needs
  the unpackaged `wails` CLI to generate its frontend bindings, and the
  rmfakecloud UI uses pnpm, which isn't in ::gentoo.
* **remarkable-tablet-driver** carries a patch so `--verbose` prints its
  arguments instead of raw format strings.
* **remarkapy** depends on `dev-python/httpx`, which ::gentoo has deprecated;
  pkgcheck warns about it.
* **restream** and **resnap** also install the ARMv7 helpers that run on the
  tablet (`/usr/share/restream/restream` and `/usr/share/resnap/lz4`); copy
  them to the device with `scp`.

## Maintaining

Version bumps of the Go, npm and .NET packages mean regenerating their
dependency lists from the new upstream release:

* `scripts/ego-sum.sh go.sum` prints an `EGO_SUM` array (rmapi, remanager).
* `scripts/npm-src-uri.py frontend/package-lock.json` prints an
  `NPM_SRC_URI` block (remanager), keeping only Linux amd64/arm64 builds of
  platform-specific packages.
* For `remarkable-remember`, run
  `NUGET_PACKAGES=<empty dir> dotnet restore -r linux-x64 src/ReMarkableRemember/ReMarkableRemember.csproj`
  (and again with `-r linux-arm64`), then list `<id>@<version>` from that
  directory, leaving out the `microsoft.*.runtime.*` and `*.host.*` packs.

For remanager, also check that `WAILS_PV` matches the `wailsapp/wails/v3`
version in upstream's `go.mod`. Then paste the output into the ebuild and
run `ebuild <file> manifest`.

## Not packaged (yet)

* **rmview** and **remy**: PyQt5 only, and PyQt5 has been removed from ::gentoo.
* **paper2remarkable**: needs `pdfplumber`, which needs `pypdfium2` (bundles
  prebuilt pdfium).
* **rmfuse / rmcl / rmrl**: pinned to old `trio` and to the retired sync API.
* **remarks** (Scrybbling-together fork): pinned to forked git versions of
  rmscene/rmc and needs PyMuPDF, which isn't in ::gentoo. Same PyMuPDF block
  for **remarkable-mcp**.
* **librm_lines** / **Moss**: the library downloads five bundled C++
  dependencies with CMake FetchContent; Moss itself is still pre-release.
* **lines-are-rusty**, **remouseable**, **rmapy**, **remarkable-cli-tooling**,
  **asTounding**, **RemaPy**, **maxio**: unmaintained, or only handle the old
  `.rm` format.
* **rmtree**, **rm-version-switcher**, **vellum**, **goMarkableStream**: run on
  the tablet itself, not on the computer (install them with reManager/Vellum).
* **RCU**: source isn't freely distributed.
