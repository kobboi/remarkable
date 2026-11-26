# remarkable overlay

Gentoo ebuild repository for host-side tools that work with the
[reMarkable](https://remarkable.com) paper tablets.

## Packages

| Package | Version | What it does |
|---|---|---|
| `dev-python/rmscene` | 0.6.1, 0.8.0 | Library for reading and writing v6 `.rm` notebook files |
| `app-text/rmc` | 0.3.0, 0.3.1_pre20261122 | Convert `.rm` files to SVG/PDF/Markdown (PDF export needs Inkscape) |
| `net-misc/rmapi` | 0.0.35 | CLI and shell for the reMarkable cloud (ddvk fork, built from source) |
| `net-misc/rmfakecloud` | 0.0.32 | Self-hosted cloud replacement, with OpenRC and systemd services |
| `x11-misc/remarkable-mouse` | 7.2.0 | Use the tablet as a mouse or pen tablet over SSH |
| `media-video/restream` | 1.5.0 | Stream the tablet screen to an ffplay window |
| `app-misc/rmirro` | 0_pre20261123 | Two-way sync between the tablet and a local folder, without the cloud |
| `app-misc/remanager` | 2.0.1 | Desktop app for installing and managing tablet mods via Vellum (all models incl. Paper Pro) |
| `app-misc/remarkable-remember` | 1.10.0 | Offline backup, PDF/EPUB upload, templates and handwriting recognition GUI |
| `app-misc/rm-exporter-bin` | 0.3.0 | Export whole folders and large notebooks to PDF over USB (amd64 only) |
| `media-gfx/resnap` | 2.5.3 | Screenshot the tablet over SSH |
| `x11-misc/remarkable-tablet-driver` | 0_pre20260506 | Pen tablet driver using uinput, so it works on Wayland too |
| `dev-python/remarkapy` | 0.3.1 | Python client for the reMarkable cloud |
| `app-text/pdf2rmnotebook` | 3.2.2 | Turn PDFs and images into editable notebooks (`.rmdoc`/`.zip`) |
| `media-gfx/drawj2d` | 1.4.0 | Drawing language with `.rm`/`.rmdoc` output (used by pdf2rmnotebook) |
| `dev-python/pylibrm-lines` | 1.3.6 | Library that renders `.rm` pages to images, text and Markdown, through librm_lines |
| `dev-python/rm-lines-sys` | 1.4.10 | librm_lines, a C++ `.rm` reader and renderer, with its ctypes bindings |
| `dev-python/rm-api` | 1.3.4 | Python library for the reMarkable cloud and rmfakecloud |
| `app-text/remarks` | 0.3.10 | Extract highlights and handwriting from notebooks to Markdown and annotated PDF (amd64 only) |
| `app-misc/remarkable-mcp` | 2.1.0 | MCP server so AI assistants can read, search and OCR tablet documents (amd64 only) |
| `app-office/ephemeris` | 1.8.1 | Daily planner PDFs from ICS calendars (amd64 only) |
| `app-text/goosepaper` | 0.8.1 | Build daily newspapers from RSS/Wikipedia and send them to the tablet (amd64 only) |
| `app-misc/codexctl` | 1.2.1_p1794370117 | Download, install, inspect and downgrade tablet firmware (amd64 only) |
| `dev-util/qmldiff` | 0_pre20260917 | Create, hash and apply QMD diffs, the format of xovi UI mods |
| `dev-util/vbuild` | 0.0.39 | Build Vellum (VELBUILD) packages in containers (amd64 only) |
| `dev-embedded/remarkable-sdk-bin` | 3.28.0.172, 3.29.1.0 | reMarkable's official cross toolchains with Qt 6, one per device |
| `dev-embedded/remarkable-os-{rm1,rm2,ferrari,chiappa,tatsu}-bin` | 3.0.4.1305 – 3.29.1.0 | reMarkable OS update images, one package per device, one slot per X.Y release |
| `dev-python/remarkable-update-image` | 1.4.2 | Library for reading OS update images (used by codexctl) |
| `dev-python/remarkable-update-fuse` | 1.4.3 | Mount OS update images with FUSE (`rmufuse`) |
| `dev-python/pymupdf` | 1.28.2 | PyMuPDF, built against the system MuPDF (amd64 only) |
| `dev-python/ext4`, `dev-python/libconf`, `dev-python/fuse-python` | | Dependencies of the above |
| `dev-python/mcp`, `dev-python/mcp-types`, `dev-python/pipcl` | 2.3.0, 2.3.0, 13 | Dependencies of remarkable-mcp and PyMuPDF |
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

**pylibrm-lines** (`dev-python/pylibrm-lines`) is a second, independent
take on the `.rm` format: a Python library over librm_lines
(`dev-python/rm-lines-sys`), a C++ reader and renderer that aims to keep up
with new firmware. It renders a page to a Pillow image or PNG, optionally
on top of a template or a PDF page as backdrop (install
`dev-python/pymupdf` for that), and extracts the typed text as plain text
or Markdown. It pulls in `dev-python/rm-api`, a client library for the
reMarkable cloud and rmfakecloud whose document models it uses. All three
are libraries, from the developer of the Moss desktop client.

**pdf2rmnotebook** (`app-text/pdf2rmnotebook`) turns PDFs and PNG/JPEG
images into a notebook whose pages are pen strokes rather than a PDF
background, so they can be erased, moved and recoloured on the tablet. It
writes a `.rmdoc` (upload it through the USB web interface) or, with `-z`,
a `.zip` for `rmapi put`; `-P` (undocumented in `-h`) sizes pages for the
Paper Pro. With `-c` and
`app-text/rmc` installed it also converts text files. The output name gets
the extension appended, so `-o notes` gives `notes.rmdoc`.

**drawj2d** (`media-gfx/drawj2d`) does the drawing for pdf2rmnotebook, but
is usable on its own: it draws from a small Tcl-like language (`.hcl`
files) and can write PDF, SVG, PNG and reMarkable `.rm`, `.rmn` and
`.rmdoc` (`drawj2d -T rmdoc drawing.hcl`), for example for custom
templates with editable lines. Its `.rm` pages use the older v5 lines
format, which the tablet upgrades when it opens them.

**remarks** (`app-text/remarks`) reads documents in the tablet's `xochitl`
layout (a copy of `/home/root/.local/share/remarkable/xochitl`, or
unpacked `.rmn`/`.rmdoc` files) and writes, per document, a PDF with the
highlights and pen strokes drawn on the pages and an Obsidian-style
Markdown file with the highlighted text, typed text and tags:
`remarks <input dir> <output dir>`. It handles the Paper Pro's coloured
highlighter; `--device` overrides the detected model. PDF pages with typed
text render better if Chromium or Chrome is installed (otherwise CairoSVG
is used).

### Cloud

**rmapi** (`net-misc/rmapi`) is a command-line client for the reMarkable
cloud, from ddvk's maintained fork. Run on its own, it opens an FTP-like
shell (`ls`, `cd`, `get`, `put`, `mkdir`, `mv`, `rm`); give it a command and
it runs that once, which suits scripts. `geta` downloads a document with its
annotations. On first start it asks for a one-time code from
my.remarkable.com to pair. It also works against rmfakecloud by pointing
`RMAPI_HOST` at it.

**rmfakecloud** (`net-misc/rmfakecloud`) is a self-hosted server that
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

**Ephemeris** (`app-office/ephemeris`) makes a daily planner PDF from ICS
calendars, local files or URLs: an hour grid with the day's events, an
all-day band and a clickable mini calendar, one page per day of
`TIME_DATE_RANGE` (`today`, `week`, `month`, …). Calendars are listed in
`~/.config/ephemeris/config.yaml` (an example is in the package's docs);
everything else is set through environment variables, see upstream's
README. It writes `output/ephemeris.pdf` in the current directory, and
skips the run when the calendars haven't changed since the last one
(`APP_FORCE_REFRESH=1` overrides). To deliver it, point `APP_POST_HOOK` at
an upload command, such as `rmapi put --force output/ephemeris.pdf /Planner`.

### AI assistants

**remarkable-mcp** (`app-misc/remarkable-mcp`) is a Model Context Protocol
server: an MCP client such as Claude Code or Claude Desktop starts it and
can then list, search and read your documents, including the text of PDFs
and EPUBs, typed notes, and handwriting through OCR (Tesseract with
`app-text/tesseract`, or Google Vision with an API key). It reaches the
tablet through the cloud (with a one-time code), `--ssh`, the USB web
interface (`--usb`) or a local copy of the files (`--local-dir`), and has
a `--read-only` mode. For example:
`claude mcp add remarkable -- remarkable-mcp --ssh`.

### Firmware

**codexctl** (`app-misc/codexctl`) manages the tablet's OS version from the
computer. It lists the firmware releases for each model, downloads update
files, and installs a chosen version over SSH, including downgrades, which
the tablet itself doesn't offer. It can also back up documents, upload PDFs,
and look inside update files without a tablet: `ls`, `cat`, `extract`, and
`mount` (with USE=`fuse`). Flashing firmware can leave the tablet unbootable
if it goes wrong, so read upstream's caveats first. It is built on
**remarkable-update-image** and **remarkable-update-fuse**; the latter also
installs `rmufuse` to mount an update image directly.

**remarkable-os-\<device\>-bin** (`dev-embedded/remarkable-os-rm1-bin`,
`-rm2-bin`, `-ferrari-bin`, `-chiappa-bin`, `-tatsu-bin`, named after the
same device codenames as the SDK's USE flags) install the OS update images
themselves, unchanged, under `/usr/share/remarkable-os/<version>`: every 3.x
release codexctl knows of, with one slot per X.Y release so several can sit
side by side, for example to `diff -r` two `rmufuse` mounts
(`emerge dev-embedded/remarkable-os-rm2-bin:3.24`). Releases differ per
device even within an X.Y (3.14.4.0 is Paper Pro only; the rM1/rM2 got
3.14.1.9), which is why each device is its own package. An image is
70–110 MB for the rM1/rM2 and 145–235 MB for the Paper Pro family; all of
them together are about 14 GB.

To mount an image, use `rmufuse` from `dev-python/remarkable-update-fuse`.
To install one on the tablet, use codexctl (`app-misc/codexctl`), which
copies the image over SSH, so the tablet doesn't download the update from
reMarkable:

```
codexctl install /usr/share/remarkable-os/3.29.1.0/remarkable-production-image-3.29.1.0-rm2-public.swu
```

codexctl checks that the image matches the tablet. It won't downgrade a
tablet from 3.11.3 or later to 3.11.2.5 or older; that has to be done by
hand.

### Development

These are for writing and packaging mods; see "Developing for the tablet"
below for how they fit together.

**qmldiff** (`dev-util/qmldiff`) is the tool behind QMD mods, the text
patches that xovi's qt-resource-rebuilder applies to the tablet's QML
interface. `create-hashtab` builds a hash table from a dump of xochitl's QML
files, `hash-diffs` turns a readable diff into the hashed form that mods ship
(and back with `-r`), and `apply-diffs` applies diffs to a QML tree, so you
can check a mod on the computer. Upstream has no releases; this is a snapshot
of master.

**vbuild** (`dev-util/vbuild`) builds Vellum packages from `VELBUILD` files,
the same way Vellum's CI does. It translates the recipe to an Alpine
`APKBUILD` and runs `abuild` inside the `ghcr.io/eeems/vbuild-builder`
container, which it pulls on first use, then signs the `.apk` with a key it
generates in `~/.config/vbuild`. It needs Podman or Docker and network
access.

**remarkable-sdk-bin** (`dev-embedded/remarkable-sdk-bin`) installs
reMarkable's official SDKs: a GCC cross compiler, Qt 6, CMake, Meson and a
sysroot matching one OS release. Pick devices with USE flags (`rm1`, `rm2`,
`ferrari` = Paper Pro, `chiappa` = Paper Pro Move, `tatsu` = Paper Pure);
each is about 0.5 GB to download and 2.7 GB installed, under
`/opt/codex/<device>/<codex version>` (5.8.203 for OS 3.28.0.172, 6.0.112
for 3.29.1.0), the path Vellum's recipes use. Source
`environment-setup-*` in that directory to get `CC`, `CXX`, `qmake6`,
`CMAKE_TOOLCHAIN_FILE` and pkg-config set up. The version is the OS release
and each release is its own slot.

### Meta package

**remarkable-meta** (`app-misc/remarkable-meta`) pulls in the tools above by
USE flag:

| USE flag | Default | Installs |
|---|---|---|
| `cloud` | on | rmapi |
| `convert` | on | rmc, pdf2rmnotebook, remarks (amd64) |
| `dev` | off | qmldiff, vbuild (amd64) |
| `firmware` | off | codexctl (amd64) |
| `mcp` | off | remarkable-mcp (amd64) |
| `gui` | off | reManager, reMarkable Remember, rm-exporter (amd64) |
| `mouse` | off | remarkable-mouse, remarkable-tablet-driver |
| `news` | off | goosepaper (amd64) |
| `planner` | off | Ephemeris (amd64) |
| `screenshot` | on | resnap |
| `server` | off | rmfakecloud |
| `stream` | on | restream |
| `sync` | on | rmirro |

It also warns when the kernel lacks the USB networking drivers that the tablet
needs (`USB_USBNET`, `USB_NET_CDCETHER`, `USB_NET_RNDIS_HOST`).

The SDK and the OS images aren't part of the meta package: they need a device
flag and can take several GB.

## Developing for the tablet

What you need depends on the kind of mod (see Vellum's packages for many
examples):

* **UI tweaks (QMD files)** need no compiler. Write a diff against xochitl's
  QML, check it with `qmldiff apply-diffs`, and hash it with
  `qmldiff hash-diffs` using a hashtab made on the tablet for that OS
  version. xovi and qt-resource-rebuilder run it on the tablet.
* **Native programs and xovi extensions** that use the tablet's Qt or
  system libraries need the SDK for the device and OS version you target:
  emerge `dev-embedded/remarkable-sdk-bin` with the device flag, source its
  `environment-setup-*`, and build with qmake6, CMake or Meson.
* **Self-contained C, Rust or Go tools** can also use a Gentoo cross
  toolchain from `sys-devel/crossdev`
  (`crossdev -t armv7a-unknown-linux-gnueabihf` for the rM1/rM2,
  `aarch64-unknown-linux-gnu` for the Paper Pro family). Link statically or
  against a glibc no newer than the tablet's, or the binary won't start on
  the device. The SDK avoids this because its sysroot matches the tablet.
* **Packaging** for Vellum: write a `VELBUILD` and build it with `vbuild`,
  or submit it to `vellum-dev/vellum`, whose CI does the same.

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
`goosepaper` (`~amd64` only).

`remanager-bin`, `remarkable-remember-bin` and `rmfakecloud-bin` were
replaced by source-built packages; `profiles/updates` moves existing
installs over.

## Packaging notes

* **rmc** 0.3.0, the latest release, pins `rmscene<0.7`, which can't read
  files from current tablet firmware, so it comes with **rmscene** 0.6.1.
  The default (highest) version is a git snapshot that works with
  rmscene 0.8.
* **rmscene** relaxes upstream's arbitrary `packaging ^23` cap.
* **rm-lines-sys** builds librm_lines against system nlohmann_json,
  utfcpp, simdutf, FreeType and HarfBuzz instead of the copies upstream's
  CMake downloads, and drops cppcodec, which is linked but never used. The
  library is installed inside the Python module, which is where the
  bindings load it from. The bundled fonts are split into static weights
  with fonttools at build time, as upstream does. PyPI has only wheels for
  it, rm-api and pylibrm-lines, so all three build from GitHub tags.
* **rm-api** uses `pypdf` instead of `PyPDF2`, which ::gentoo removed
  (only `PdfReader` is used), and drops `httpx` and `packaging`, which it
  lists but never imports. Its upstream tests are removed from the
  installed package.
* **pylibrm-lines** drops the unused `ipykernel` requirement and makes
  `pymupdf` optional. Its output-format test is skipped: it needs the
  unpackaged `pygameextra`.
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
* **rmfakecloud** is built from source like remanager, except that its web
  UI uses pnpm (`>=sys-apps/pnpm-bin-12` from ::guru). Each tarball in
  `pnpm-lock.yaml` is a distfile; `src_prepare` lays them out like the npm
  registry and pnpm installs from that as a `file://` registry, with the
  lockfile unchanged (pnpm 12 rejects rewritten resolutions) and
  `--trust-lockfile`, since its supply-chain check needs registry metadata.
  `scripts/npm-src-uri.py` reads pnpm lockfiles as well as npm ones.
  Unlike `rmfakecloud-bin`, which it replaced, it has no `~arm` keyword:
  pnpm-bin has no arm build.
* **rm-exporter** stays binary for now: it needs the unpackaged `wails` CLI
  to generate its frontend bindings.
* **remarkable-tablet-driver** carries a patch so `--verbose` prints its
  arguments instead of raw format strings.
* **remarkable-sdk-bin** repeats what the Yocto installer does with
  `-d <dir>` (unpack the payload, rewrite ELF interpreters with the bundled
  `relocate_sdk.py`, generate the CMake/Meson cross files, fix text files
  and symlinks), but stages into the image while baking in the final
  `/opt/codex` paths. reMarkable publishes no license for the bundle, so it
  is `RESTRICT="bindist mirror"`. Binary QA checks are off for its ~60,000
  prebuilt files.
* **remarkable-os-\*-bin** fetch the images from the S3 bucket codexctl
  downloads from (`.swu` files at its root, the older `.signed` ones under
  `omaha/rm1` and `omaha/rm2`). The ebuilds are generated, and are
  `RESTRICT="bindist mirror"` for the same reason as the SDK.
* **ext4**, **remarkable-update-image**, **remarkable-update-fuse** and
  **vbuild** are built as plain Python instead of being compiled with
  Nuitka as upstream does, and their exact `==` pins are relaxed. vbuild also
  needs its `cli` subpackage listed, which the Nuitka build finds by itself.
* **codexctl** drops upstream's `<3.14` Python cap and exact pins, and makes
  the FUSE mount support optional, since the module is only imported by
  `codexctl mount`.
* **remarkapy** depends on `dev-python/httpx`, which ::gentoo has deprecated;
  pkgcheck warns about it.
* **drawj2d** is built from its source tarball with `java-pkg-simple`
  instead of using the prebuilt jar. The source bundles the libraries it
  uses (FreeHEP, Hecl, JLaTeXMath, PDFRenderer, …), which is why
  `LICENSE` is long; the TCL DXF part carries only a warranty disclaimer.
* **pdf2rmnotebook** is a snapshot: upstream bumped the script to 3.2.2
  without tagging it. Its templates go to `/usr/share/pdf2rmnotebook`
  instead of `/var/lib`.
* **Ephemeris** has no Python packaging and finds its fonts and cover page
  next to its modules, so it is installed under `/usr/share/ephemeris` with
  a wrapper. Upstream keeps `config.yaml` and the change-detection file
  in the program's directory; the wrapper moves them to
  `~/.config/ephemeris/` and `~/.local/state/ephemeris/` unless
  `APP_CONFIG_PATH`/`APP_META_FILE_PATH` are set. The unused `pypdf`
  requirement is dropped, and the exact `==` pins are relaxed (it runs
  with icalendar 7, upstream pins 6). PNG/SVG output needs
  `app-text/poppler[cairo,utils]`. It depends on `dev-python/reportlab`,
  which ::gentoo has deprecated because 5.x is broken, so it is capped
  below 5 and pkgcheck warns about it. amd64 only, since `dev-python/loguru`
  has no arm64 keyword.
* **pymupdf** is built against `app-text/mupdf`, which has to be the same
  X.Y release (1.28), instead of downloading and building its own MuPDF
  with bundled libraries. PyMuPDF also needs MuPDF's C++ and Python (SWIG)
  bindings, which `app-text/mupdf` doesn't build, so the ebuild generates
  them from the matching MuPDF source with MuPDF's `mupdfwrap.py` (this
  takes several minutes) and installs `libmupdfcpp` and `_mupdf.so` inside
  the `pymupdf` package. They are built once for Python's stable ABI.
  PyMuPDF 2.x isn't packaged: it pulls in onnxruntime and other AI
  layout packages. `scripts/check-updates.py` only reports 1.28.x
  releases for it. The test suite pip-installs its own requirements, so
  it is restricted; upstream's tests passed outside portage, against this
  build.
* **remarks** depends on its own forks of rmscene and rmc, which have
  diverged far from upstream's (a rewritten SVG exporter, highlight
  colours). They are installed privately under `/usr/lib/remarks` next
  to remarks itself, so they don't clash with `dev-python/rmscene` and
  `app-text/rmc`. Its hosted web service (`remarks-server`, with flask,
  gunicorn and sentry-sdk) is left out, as are dependencies it never
  imports (parsita, numpy, markupsafe).
* **remarkable-mcp** drops `ebooklib` from its requirements; 2.1.0 never
  imports it.
* **mcp** 2.3.0 is here because ::guru only has 1.x, which
  remarkable-mcp can't use. Nothing in ::gentoo or ::guru depends on
  `dev-python/mcp`, so the newer version in this overlay replaces
  ::guru's without breaking anything. Its tests are restricted (they need
  git-only test dependencies).
* **restream** and **resnap** also install the ARMv7 helpers that run on the
  tablet (`/usr/share/restream/restream` and `/usr/share/resnap/lz4`); copy
  them to the device with `scp`.

## Maintaining

`scripts/check-updates.py` checks every package against upstream (PyPI,
GitHub tags and commits, reMarkable's SDK links and codexctl's firmware
list) and lists what is outdated; `-q` prints only those, and it exits 1
when something is.

New firmware releases need no hand editing:
`scripts/os-image-ebuilds.py` reads codexctl's `version-ids.json` and writes
an ebuild for each device's 3.x releases that have none yet. Then run
`ebuild <file> manifest` in each changed package, which downloads the new
images.

Version bumps of the Go, npm, .NET and Rust packages mean regenerating their
dependency lists from the new upstream release:

* `scripts/ego-sum.sh go.sum` prints an `EGO_SUM` array (rmapi, remanager).
* `scripts/npm-src-uri.py frontend/package-lock.json` prints an
  `NPM_SRC_URI` block (remanager), keeping only Linux amd64/arm64 builds of
  platform-specific packages.
* For `remarkable-remember`, run
  `NUGET_PACKAGES=<empty dir> dotnet restore -r linux-x64 src/ReMarkableRemember/ReMarkableRemember.csproj`
  (and again with `-r linux-arm64`), then list `<id>@<version>` from that
  directory, leaving out the `microsoft.*.runtime.*` and `*.host.*` packs.
* `scripts/cargo-crates.py Cargo.lock` prints a `CRATES` block (qmldiff);
  also update `COMMIT` and the crate licenses in `LICENSE`.
* For a new SDK, copy the ebuild to the new OS version and update
  `SDK_PV` from the installer names on
  https://developer.remarkable.com/links (older releases put the files in
  per-device subdirectories, so check `BASE_URI` too).

For remanager, also check that `WAILS_PV` matches the `wailsapp/wails/v3`
version in upstream's `go.mod`. Then paste the output into the ebuild and
run `ebuild <file> manifest`.

## Not packaged (yet)

* **rmview** and **remy**: PyQt5 only, and PyQt5 has been removed from ::gentoo.
* **paper2remarkable**: needs `pdfplumber`, which needs `pypdfium2` (bundles
  prebuilt pdfium).
* **rmfuse / rmcl / rmrl**: pinned to old `trio` and to the retired sync API.
  Nothing else mounts the cloud as a filesystem. For the tablet itself
  (checked 2026-11-24):
  * [tomaszwaraksa/remarkable-fs](https://github.com/tomaszwaraksa/remarkable-fs)
    (Go, MIT) mounts the tablet over SSH, by USB or WiFi, with the real
    folder names. It opens notebooks as rendered PDFs and can upload, make
    folders and delete. It is too new to package yet: first commit
    2026-11-16, reMarkable 2 only, and upstream takes no issues or pull
    requests.
  * [nick8325/remarkable-fs](https://github.com/nick8325/remarkable-fs)
    (Python) hasn't changed since 2022 and predates the v6 format.
  * `sshfs` on `/home/root/.local/share/remarkable/xochitl` works, but shows
    the raw UUID-named files.

  Until then, `rmirro` (a local mirror as PDFs, both ways) and `rmapi`'s
  shell are the closest equivalents.
* **url2epub**: a library plus a Telegram bot that runs on Google Cloud Run;
  there is no command-line tool to package.
* **Moss**: still pre-release. Its rendering and cloud libraries are
  packaged (`dev-python/pylibrm-lines`, `dev-python/rm-api`).
* **lines-are-rusty**, **remouseable**, **rmapy**, **remarkable-cli-tooling**,
  **asTounding**, **RemaPy**, **maxio**: unmaintained, or only handle the old
  `.rm` format.
* **rmtree**, **rm-version-switcher**, **vellum**, **goMarkableStream**: run on
  the tablet itself, not on the computer (install them with reManager/Vellum).
* **RCU**: source isn't freely distributed.
* **toltec's build tool** (`toltecmk`): archived upstream; vbuild replaces
  it. toltec's and Eeems's toolchain container images are pulled by vbuild
  itself, so they aren't packaged.
* **libremarkable**, **rmkit**, **xovi** and its extensions: frameworks and
  libraries that are built into tablet programs with the SDK, not host
  tools.
