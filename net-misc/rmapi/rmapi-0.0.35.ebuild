# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Go client and interactive shell for the reMarkable cloud API"
HOMEPAGE="https://github.com/ddvk/rmapi"

EGO_SUM=(
	"github.com/abiosoft/ishell v2.0.0+incompatible"
	"github.com/abiosoft/ishell v2.0.0+incompatible/go.mod"
	"github.com/abiosoft/readline v0.0.0-20180607040430-155bce2042db"
	"github.com/abiosoft/readline v0.0.0-20180607040430-155bce2042db/go.mod"
	"github.com/adrg/strutil v0.1.0"
	"github.com/adrg/strutil v0.1.0/go.mod"
	"github.com/adrg/sysfont v0.1.0"
	"github.com/adrg/sysfont v0.1.0/go.mod"
	"github.com/adrg/xdg v0.2.1"
	"github.com/adrg/xdg v0.2.1/go.mod"
	"github.com/boombuler/barcode v1.0.0"
	"github.com/boombuler/barcode v1.0.0/go.mod"
	"github.com/chzyer/logex v1.1.10"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/fatih/color v1.9.0"
	"github.com/fatih/color v1.9.0/go.mod"
	"github.com/golang-jwt/jwt v3.2.2+incompatible"
	"github.com/golang-jwt/jwt v3.2.2+incompatible/go.mod"
	"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0"
	"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0/go.mod"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510/go.mod"
	"github.com/google/uuid v1.1.1"
	"github.com/google/uuid v1.1.1/go.mod"
	"github.com/gunnsth/pkcs7 v0.0.0-20181213175627-3cffc6fbfe83"
	"github.com/gunnsth/pkcs7 v0.0.0-20181213175627-3cffc6fbfe83/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/mattn/go-colorable v0.1.4/go.mod"
	"github.com/mattn/go-colorable v0.1.6"
	"github.com/mattn/go-colorable v0.1.6/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.11/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646/go.mod"
	"github.com/ogier/pflag v0.0.1"
	"github.com/ogier/pflag v0.0.1/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.5.1"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/unidoc/unipdf/v3 v3.6.1"
	"github.com/unidoc/unipdf/v3 v3.6.1/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/image v0.0.0-20181116024801-cd38e8056d9b/go.mod"
	"golang.org/x/image v0.5.0"
	"golang.org/x/image v0.5.0/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.1.0"
	"golang.org/x/sync v0.1.0/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.7.0"
	"golang.org/x/text v0.7.0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.8"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
)
go-module_set_globals

# The eclass emits mirror://goproxy//<module> URIs; goproxy.io answers those
# for golang.org/x/* with an HTML page (HTTP 200), which then fails the
# Manifest check at random. Fetch from proxy.golang.org directly instead.
SRC_URI="
	https://github.com/ddvk/rmapi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI//mirror:\/\/goproxy\/\//https://proxy.golang.org/}
"

LICENSE="AGPL-3"
# Dependent licenses
LICENSE+=" Apache-2.0 BSD BSD-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

src_compile() {
	ego build -o ${PN} \
		-ldflags "-X github.com/juruen/rmapi/version.Version=v${PV}" .
}

src_test() {
	ego test ./...
}

src_install() {
	dobin ${PN}
	dodoc CHANGELOG.md README.md
	[[ -d docs ]] && dodoc -r docs/.
}

pkg_postinst() {
	elog "Run '${PN}' once to pair it with your reMarkable cloud account."
	elog "To use a self-hosted rmfakecloud instance instead, set"
	elog "RMAPI_HOST=https://your.rmfakecloud.host before running ${PN}."
}
