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

## The tools

Most tools reach the tablet over SSH or over the USB web interface. Over
USB, the tablet is at `10.11.99.1`. The root password is under Settings >
Help > Copyrights and licenses > General information. The USB web interface is switched on under
Settings > Storage.

### Notebook files

**rmscene** (`dev-python/rmscene`) is a Python library for the v6 `.rm`
format that tablets have written since firmware 3.0. It parses a page into a
scene tree of layers, strokes, highlights and typed text, and can write that
tree back out. It is a library only; `rmc` is its command-line front end.

**rmc** (`app-text/rmc`) converts `.rm` pages, as found in the tablet's
`xochitl` directory or in a downloaded notebook, to SVG, PDF or Markdown.
SVG keeps the pen strokes. Markdown extracts the typed text and the
highlighted passages. PDF output renders the SVG through Inkscape, so install
`media-gfx/inkscape` for it. It can also go the other way and turn a Markdown
file into a `.rm` page of typed text.

### Cloud

**rmapi** (`net-misc/rmapi`) is a command-line client for the reMarkable
cloud, from ddvk's maintained fork. Run on its own, it opens an FTP-like
shell (`ls`, `cd`, `get`, `put`, `mkdir`, `mv`, `rm`); give it a command and
it runs that once, which suits scripts. `geta` downloads a document with its
annotations. On first start it asks for a one-time code from
my.remarkable.com to pair. It also works against rmfakecloud by pointing
`RMAPI_HOST` at it.

**rmfakecloud** (`net-misc/rmfakecloud-bin`) is a self-hosted server that
speaks the reMarkable sync protocol, so documents sync to your own machine
instead of reMarkable's cloud. Its web UI lets you browse, upload and
download documents. It can also send documents by email over SMTP. It runs as
the `rmfakecloud` user from an OpenRC or systemd service, configured in
`/etc/rmfakecloud.conf`. The tablet needs `rmfakecloud-proxy` installed to
send its traffic there.

**remarkapy** (`dev-python/remarkapy`) is a Python library for the
reMarkable cloud API. Use it to list, download and upload documents from
your own scripts. It also installs a small `remarkapy` (alias `rkpy`)
command.

### Sync and backup

**rmirro** (`app-misc/rmirro`) syncs the tablet with a local folder in both
directions, without the cloud. Documents and notebooks are pulled as PDFs,
rendered through the USB web interface by default, and PDFs or EPUBs you add
to the folder are pushed to the tablet. Unchanged files are skipped on later
runs. Deleting a document on the tablet deletes its PDF locally, but deleting
a local file never deletes it on the tablet. Every run first makes a raw
backup and asks before changing anything. The renderer is a replaceable
script, so it can use `rmc` instead. It needs passwordless `ssh remarkable`
access and `rsync`.

**rm-exporter** (`app-misc/rm-exporter-bin`) is a small GUI that exports
whole folders, or notebooks too large for the tablet's own web interface, to
PDF over USB. It walks the folder tree, downloads each document through the
USB web interface and recreates the folders locally.

**reMarkable Remember** (`app-misc/remarkable-remember`) is a desktop app
that browses the tablet's library over SSH (USB or WiFi). It backs up
notebooks and folders, syncs PDFs, and uploads PDF and EPUB files; the PDF
transfers need USB and the USB web interface. It also installs custom page
templates and can turn handwriting into text through MyScript's recognition
service, which needs a free MyScript developer key.

### Screen

**restream** (`media-video/restream`) shows the tablet's screen live in a
window on the computer, for presenting or screen recording. It has two
halves. A small ARMv7 program on the tablet reads the framebuffer and sends
it compressed over SSH. On the computer, it is decompressed and played in
`ffplay`. It can also feed a `v4l2loopback` device, so the screen shows up
as a webcam in video calls. Copy the tablet half once with
`scp /usr/share/restream/restream root@10.11.99.1:/home/root/restream`.

**resnap** (`media-gfx/resnap`) takes a screenshot of the tablet over SSH and
saves it as PNG, then shows it in `feh` (`-n` only saves it). Options choose
landscape orientation (`-l`), copy the image to the clipboard (`-x`), or make
the paper background transparent (`-f`), and `-s` takes a WiFi address. Copying the
bundled `lz4` to the tablet makes the transfer faster:
`scp /usr/share/resnap/lz4 root@10.11.99.1:/home/root/lz4`.

### Pen input

**remarkable-mouse** (`x11-misc/remarkable-mouse`) turns the tablet into a
pointing device. It reads pen events over SSH. By default it moves the mouse
pointer, mapping the tablet onto a monitor (`--monitor`, `--orientation`,
`--region` to pick an area). With `--evdev` it creates a virtual Linux tablet
device with pressure instead, for drawing programs. It does not work on
Wayland; use remarkable-tablet-driver there.

**remarkable-tablet-driver** (`x11-misc/remarkable-tablet-driver`) does the
same job as a C++ program built on libssh. It creates a virtual pen tablet
through uinput, with pressure, tilt, the eraser end and the pen button, so
it works under Wayland as well as X11. Orientation and active area are left
to your desktop's tablet settings (e.g. KDE Plasma's). Your user needs write
access to `/dev/uinput` (`CONFIG_INPUT_UINPUT`).

### Tablet management

**reManager** (`app-misc/remanager`) is a desktop app for modding the tablet
without a terminal. It connects over SSH and uses the Vellum package manager
on the tablet to browse, install, upgrade and remove community mods, with
dependencies resolved for you. It also offers a terminal, a file browser,
backup and restore, document import (PDF, EPUB, rmdoc), a config file
editor, custom sleep screens, auto-update control, guided recovery after OS
updates and switching between OS versions. It supports every model,
including the Paper Pro, Paper Pro Move and Paper Pure, and remembers
several tablets.

### Content

**goosepaper** (`app-text/goosepaper`) builds a daily "newspaper" PDF to read
on the tablet. A JSON config lists the sources, such as RSS feeds,
Wikipedia's current events, Mastodon, Bluesky, Reddit and weather, and picks
a style and a page profile per tablet model. With `--deliver` it uploads the
result through rmapi's credentials.

### Meta package

**remarkable-meta** (`app-misc/remarkable-meta`) pulls in the tools above by
USE flag:

| USE flag | Default | Installs |
|---|---|---|
| `cloud` | on | rmapi |
| `convert` | on | rmc |
| `gui` | off | reManager, reMarkable Remember, rm-exporter (amd64) |
| `mouse` | off | remarkable-mouse, remarkable-tablet-driver |
| `news` | off | goosepaper (amd64) |
| `screenshot` | on | resnap |
| `server` | off | rmfakecloud |
| `stream` | on | restream |
| `sync` | on | rmirro |

It also warns when the kernel lacks the USB networking drivers that the tablet
needs (`USB_USBNET`, `USB_NET_CDCETHER`, `USB_NET_RNDIS_HOST`).

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
