# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Self-hosted replacement for the reMarkable cloud"
HOMEPAGE="
	https://github.com/ddvk/rmfakecloud
	https://ddvk.github.io/rmfakecloud/
"

# Generated with: scripts/ego-sum.sh go.sum
EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.34.0/go.mod"
	"cloud.google.com/go v0.38.0/go.mod"
	"cloud.google.com/go v0.44.1/go.mod"
	"cloud.google.com/go v0.44.2/go.mod"
	"cloud.google.com/go v0.45.1/go.mod"
	"cloud.google.com/go v0.46.3/go.mod"
	"cloud.google.com/go v0.50.0/go.mod"
	"cloud.google.com/go v0.52.0/go.mod"
	"cloud.google.com/go v0.53.0/go.mod"
	"cloud.google.com/go v0.54.0/go.mod"
	"cloud.google.com/go v0.56.0/go.mod"
	"cloud.google.com/go v0.57.0/go.mod"
	"cloud.google.com/go v0.62.0/go.mod"
	"cloud.google.com/go v0.65.0/go.mod"
	"cloud.google.com/go/bigquery v1.0.1/go.mod"
	"cloud.google.com/go/bigquery v1.3.0/go.mod"
	"cloud.google.com/go/bigquery v1.4.0/go.mod"
	"cloud.google.com/go/bigquery v1.5.0/go.mod"
	"cloud.google.com/go/bigquery v1.7.0/go.mod"
	"cloud.google.com/go/bigquery v1.8.0/go.mod"
	"cloud.google.com/go/datastore v1.0.0/go.mod"
	"cloud.google.com/go/datastore v1.1.0/go.mod"
	"cloud.google.com/go/pubsub v1.0.1/go.mod"
	"cloud.google.com/go/pubsub v1.1.0/go.mod"
	"cloud.google.com/go/pubsub v1.2.0/go.mod"
	"cloud.google.com/go/pubsub v1.3.1/go.mod"
	"cloud.google.com/go/storage v1.0.0/go.mod"
	"cloud.google.com/go/storage v1.5.0/go.mod"
	"cloud.google.com/go/storage v1.6.0/go.mod"
	"cloud.google.com/go/storage v1.8.0/go.mod"
	"cloud.google.com/go/storage v1.10.0/go.mod"
	"dmitri.shuralyov.com/gpu/mtl v0.0.0-20190408044501-666a987793e9/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802/go.mod"
	"github.com/ChannelMeter/iso8601duration v0.0.0-20150204201828-8da3af7a2a61"
	"github.com/ChannelMeter/iso8601duration v0.0.0-20150204201828-8da3af7a2a61/go.mod"
	"github.com/adrg/strutil v0.2.2/go.mod"
	"github.com/adrg/strutil v0.3.1"
	"github.com/adrg/strutil v0.3.1/go.mod"
	"github.com/adrg/sysfont v0.1.2"
	"github.com/adrg/sysfont v0.1.2/go.mod"
	"github.com/adrg/xdg v0.3.0/go.mod"
	"github.com/adrg/xdg v0.4.0"
	"github.com/adrg/xdg v0.4.0/go.mod"
	"github.com/apognu/gocal v0.9.1"
	"github.com/apognu/gocal v0.9.1/go.mod"
	"github.com/boombuler/barcode v1.0.0/go.mod"
	"github.com/bytedance/sonic v1.5.0/go.mod"
	"github.com/bytedance/sonic v1.10.0-rc/go.mod"
	"github.com/bytedance/sonic v1.11.3"
	"github.com/bytedance/sonic v1.11.3/go.mod"
	"github.com/census-instrumentation/opencensus-proto v0.2.1/go.mod"
	"github.com/channelmeter/iso8601duration v0.0.0-20150204201828-8da3af7a2a61"
	"github.com/channelmeter/iso8601duration v0.0.0-20150204201828-8da3af7a2a61/go.mod"
	"github.com/chenzhuoyu/base64x v0.0.0-20211019084208-fb5309c8db06/go.mod"
	"github.com/chenzhuoyu/base64x v0.0.0-20221115062448-fe3a3abad311/go.mod"
	"github.com/chenzhuoyu/base64x v0.0.0-20230717121745-296ad89f973d"
	"github.com/chenzhuoyu/base64x v0.0.0-20230717121745-296ad89f973d/go.mod"
	"github.com/chenzhuoyu/iasm v0.9.0/go.mod"
	"github.com/chenzhuoyu/iasm v0.9.1"
	"github.com/chenzhuoyu/iasm v0.9.1/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/cncf/udpa/go v0.0.0-20191209042840-269d4d468f6f/go.mod"
	"github.com/danjacques/gofslock v0.0.0-20240212154529-d899e02bfe22"
	"github.com/danjacques/gofslock v0.0.0-20240212154529-d899e02bfe22/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dropbox/dropbox-sdk-go-unofficial/v6 v6.0.5"
	"github.com/dropbox/dropbox-sdk-go-unofficial/v6 v6.0.5/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.0/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.1-0.20191026205805-5f8ba28d4473/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.4/go.mod"
	"github.com/envoyproxy/protoc-gen-validate v0.1.0/go.mod"
	"github.com/gabriel-vasile/mimetype v1.4.3"
	"github.com/gabriel-vasile/mimetype v1.4.3/go.mod"
	"github.com/gin-contrib/sse v0.1.0"
	"github.com/gin-contrib/sse v0.1.0/go.mod"
	"github.com/gin-gonic/gin v1.9.1"
	"github.com/gin-gonic/gin v1.9.1/go.mod"
	"github.com/go-gl/glfw v0.0.0-20190409004039-e6da0acd62b1/go.mod"
	"github.com/go-gl/glfw/v3.3/glfw v0.0.0-20191125211704-12ad95a8df72/go.mod"
	"github.com/go-gl/glfw/v3.3/glfw v0.0.0-20200222043503-6f7a984d4dc4/go.mod"
	"github.com/go-playground/assert/v2 v2.2.0"
	"github.com/go-playground/assert/v2 v2.2.0/go.mod"
	"github.com/go-playground/locales v0.14.1"
	"github.com/go-playground/locales v0.14.1/go.mod"
	"github.com/go-playground/universal-translator v0.18.1"
	"github.com/go-playground/universal-translator v0.18.1/go.mod"
	"github.com/go-playground/validator/v10 v10.19.0"
	"github.com/go-playground/validator/v10 v10.19.0/go.mod"
	"github.com/goccy/go-json v0.10.2"
	"github.com/goccy/go-json v0.10.2/go.mod"
	"github.com/golang-jwt/jwt/v4 v4.5.2"
	"github.com/golang-jwt/jwt/v4 v4.5.2/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20190702054246-869f871628b6/go.mod"
	"github.com/golang/groupcache v0.0.0-20191227052852-215e87163ea7/go.mod"
	"github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/mock v1.3.1/go.mod"
	"github.com/golang/mock v1.4.0/go.mod"
	"github.com/golang/mock v1.4.1/go.mod"
	"github.com/golang/mock v1.4.3/go.mod"
	"github.com/golang/mock v1.4.4/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.3.3/go.mod"
	"github.com/golang/protobuf v1.3.4/go.mod"
	"github.com/golang/protobuf v1.3.5/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.1/go.mod"
	"github.com/golang/protobuf v1.4.2/go.mod"
	"github.com/golang/protobuf v1.5.0/go.mod"
	"github.com/golang/protobuf v1.5.2/go.mod"
	"github.com/golang/protobuf v1.5.4"
	"github.com/golang/protobuf v1.5.4/go.mod"
	"github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.4.1/go.mod"
	"github.com/google/go-cmp v0.5.0/go.mod"
	"github.com/google/go-cmp v0.5.1/go.mod"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/martian v2.1.0+incompatible/go.mod"
	"github.com/google/martian/v3 v3.0.0/go.mod"
	"github.com/google/pprof v0.0.0-20181206194817-3ea8567a2e57/go.mod"
	"github.com/google/pprof v0.0.0-20190515194954-54271f7e092f/go.mod"
	"github.com/google/pprof v0.0.0-20191218002539-d4f498aebedc/go.mod"
	"github.com/google/pprof v0.0.0-20200212024743-f11f1df84d12/go.mod"
	"github.com/google/pprof v0.0.0-20200229191704-1ebb73c60ed3/go.mod"
	"github.com/google/pprof v0.0.0-20200430221834-fc25d7d30c6d/go.mod"
	"github.com/google/pprof v0.0.0-20200708004538-1a94d8640e99/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/uuid v1.6.0"
	"github.com/google/uuid v1.6.0/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.4/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.5/go.mod"
	"github.com/gorilla/i18n v0.0.0-20150820051429-8b358169da46"
	"github.com/gorilla/i18n v0.0.0-20150820051429-8b358169da46/go.mod"
	"github.com/gorilla/websocket v1.5.1"
	"github.com/gorilla/websocket v1.5.1/go.mod"
	"github.com/hashicorp/golang-lru v0.5.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.1/go.mod"
	"github.com/ianlancetaylor/demangle v0.0.0-20181102032728-5e5cf60278f6/go.mod"
	"github.com/jinzhu/copier v0.3.5"
	"github.com/jinzhu/copier v0.3.5/go.mod"
	"github.com/json-iterator/go v1.1.12"
	"github.com/json-iterator/go v1.1.12/go.mod"
	"github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod"
	"github.com/jstemmer/go-junit-report v0.9.1/go.mod"
	"github.com/jung-kurt/gofpdf v1.0.0/go.mod"
	"github.com/jung-kurt/gofpdf v1.16.2"
	"github.com/jung-kurt/gofpdf v1.16.2/go.mod"
	"github.com/juruen/rmapi v0.0.25"
	"github.com/juruen/rmapi v0.0.25/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/cpuid/v2 v2.0.9/go.mod"
	"github.com/klauspost/cpuid/v2 v2.2.7"
	"github.com/klauspost/cpuid/v2 v2.2.7/go.mod"
	"github.com/knz/go-libedit v1.10.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/leodido/go-urn v1.4.0"
	"github.com/leodido/go-urn v1.4.0/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/mochi-mqtt/server/v2 v2.7.9"
	"github.com/mochi-mqtt/server/v2 v2.7.9/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v1.0.2"
	"github.com/modern-go/reflect2 v1.0.2/go.mod"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646/go.mod"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e"
	"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod"
	"github.com/pelletier/go-toml/v2 v2.2.0"
	"github.com/pelletier/go-toml/v2 v2.2.0/go.mod"
	"github.com/phpdave11/gofpdi v1.0.7/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/poundifdef/go-remarkable2pdf v0.2.0"
	"github.com/poundifdef/go-remarkable2pdf v0.2.0/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/rifflock/lfshook v0.0.0-20180920164130-b9218ef580f5"
	"github.com/rifflock/lfshook v0.0.0-20180920164130-b9218ef580f5/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/rs/xid v1.4.0"
	"github.com/rs/xid v1.4.0/go.mod"
	"github.com/ruudk/golang-pdf417 v0.0.0-20181029194003-1af4ab5afa58/go.mod"
	"github.com/secsy/goftp v0.0.0-20200609142545-aa2de14babf4"
	"github.com/secsy/goftp v0.0.0-20200609142545-aa2de14babf4/go.mod"
	"github.com/sirupsen/logrus v1.5.0/go.mod"
	"github.com/sirupsen/logrus v1.9.3"
	"github.com/sirupsen/logrus v1.9.3/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/objx v0.5.2/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.1/go.mod"
	"github.com/stretchr/testify v1.8.4/go.mod"
	"github.com/stretchr/testify v1.9.0"
	"github.com/stretchr/testify v1.9.0/go.mod"
	"github.com/studio-b12/gowebdav v0.9.0"
	"github.com/studio-b12/gowebdav v0.9.0/go.mod"
	"github.com/twitchyliquid64/golang-asm v0.15.1"
	"github.com/twitchyliquid64/golang-asm v0.15.1/go.mod"
	"github.com/ugorji/go/codec v1.2.12"
	"github.com/ugorji/go/codec v1.2.12/go.mod"
	"github.com/unidoc/freetype v0.2.3"
	"github.com/unidoc/freetype v0.2.3/go.mod"
	"github.com/unidoc/pkcs7 v0.0.0-20200411230602-d883fd70d1df/go.mod"
	"github.com/unidoc/pkcs7 v0.2.0"
	"github.com/unidoc/pkcs7 v0.2.0/go.mod"
	"github.com/unidoc/timestamp v0.0.0-20200412005513-91597fd3793a"
	"github.com/unidoc/timestamp v0.0.0-20200412005513-91597fd3793a/go.mod"
	"github.com/unidoc/unichart v0.3.0"
	"github.com/unidoc/unichart v0.3.0/go.mod"
	"github.com/unidoc/unipdf/v3 v3.56.0"
	"github.com/unidoc/unipdf/v3 v3.56.0/go.mod"
	"github.com/unidoc/unitype v0.4.0"
	"github.com/unidoc/unitype v0.4.0/go.mod"
	"github.com/yuin/goldmark v1.1.25/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"github.com/yuin/goldmark v1.1.32/go.mod"
	"github.com/yuin/goldmark v1.2.1/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"go.opencensus.io v0.21.0/go.mod"
	"go.opencensus.io v0.22.0/go.mod"
	"go.opencensus.io v0.22.2/go.mod"
	"go.opencensus.io v0.22.3/go.mod"
	"go.opencensus.io v0.22.4/go.mod"
	"golang.org/x/arch v0.0.0-20210923205945-b76863e36670/go.mod"
	"golang.org/x/arch v0.7.0"
	"golang.org/x/arch v0.7.0/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/crypto v0.36.0"
	"golang.org/x/crypto v0.36.0/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/exp v0.0.0-20190306152737-a1d7652674e8/go.mod"
	"golang.org/x/exp v0.0.0-20190510132918-efd6b22b2522/go.mod"
	"golang.org/x/exp v0.0.0-20190829153037-c13cbed26979/go.mod"
	"golang.org/x/exp v0.0.0-20191030013958-a1ab85dbe136/go.mod"
	"golang.org/x/exp v0.0.0-20191129062945-2f5052295587/go.mod"
	"golang.org/x/exp v0.0.0-20191227195350-da58074b4299/go.mod"
	"golang.org/x/exp v0.0.0-20200119233911-0405dc783f0a/go.mod"
	"golang.org/x/exp v0.0.0-20200207192155-f17229e696bd/go.mod"
	"golang.org/x/exp v0.0.0-20200224162631-6cc2880d07d6/go.mod"
	"golang.org/x/image v0.0.0-20190227222117-0694c2d4d067/go.mod"
	"golang.org/x/image v0.0.0-20190802002840-cff245a6509b/go.mod"
	"golang.org/x/image v0.0.0-20190910094157-69e4b8554b2a/go.mod"
	"golang.org/x/image v0.0.0-20211028202545-6944b10bf410/go.mod"
	"golang.org/x/image v0.18.0"
	"golang.org/x/image v0.18.0/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190301231843-5614ed5bae6f/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/lint v0.0.0-20190409202823-959b441ac422/go.mod"
	"golang.org/x/lint v0.0.0-20190909230951-414d861bb4ac/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/lint v0.0.0-20191125180803-fdd1cda4f05f/go.mod"
	"golang.org/x/lint v0.0.0-20200130185559-910be7a94367/go.mod"
	"golang.org/x/lint v0.0.0-20200302205851-738671d3881b/go.mod"
	"golang.org/x/mobile v0.0.0-20190312151609-d3739f865fa6/go.mod"
	"golang.org/x/mobile v0.0.0-20190719004257-d2bd2a29d028/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.0/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.1.1-0.20191107180719-034126e5016b/go.mod"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/mod v0.3.0/go.mod"
	"golang.org/x/mod v0.4.0/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190501004415-9ce7a6920f09/go.mod"
	"golang.org/x/net v0.0.0-20190503192946-f4e77d36d62c/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190628185345-da137c7871d7/go.mod"
	"golang.org/x/net v0.0.0-20190724013045-ca1201d0de80/go.mod"
	"golang.org/x/net v0.0.0-20191209160850-c0dbc17a3553/go.mod"
	"golang.org/x/net v0.0.0-20200114155413-6afb5195e5aa/go.mod"
	"golang.org/x/net v0.0.0-20200202094626-16171245cfb2/go.mod"
	"golang.org/x/net v0.0.0-20200222125558-5a598a2470a0/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/net v0.0.0-20200301022130-244492dfa37a/go.mod"
	"golang.org/x/net v0.0.0-20200324143707-d3edc9973b7e/go.mod"
	"golang.org/x/net v0.0.0-20200501053045-e0ff5e5a1de5/go.mod"
	"golang.org/x/net v0.0.0-20200506145744-7e3656a0809f/go.mod"
	"golang.org/x/net v0.0.0-20200513185701-a91f0712d120/go.mod"
	"golang.org/x/net v0.0.0-20200520182314-0ba52f642ac2/go.mod"
	"golang.org/x/net v0.0.0-20200625001655-4c5254603344/go.mod"
	"golang.org/x/net v0.0.0-20200707034311-ab3426394381/go.mod"
	"golang.org/x/net v0.0.0-20200822124328-c89045814202/go.mod"
	"golang.org/x/net v0.0.0-20201021035429-f5854403a974/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.38.0"
	"golang.org/x/net v0.38.0/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod"
	"golang.org/x/oauth2 v0.0.0-20191202225959-858c2ad4c8b6/go.mod"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d/go.mod"
	"golang.org/x/oauth2 v0.0.0-20201208152858-08078c50e5b5/go.mod"
	"golang.org/x/oauth2 v0.18.0"
	"golang.org/x/oauth2 v0.18.0/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20200317015054-43a5402ce75a/go.mod"
	"golang.org/x/sync v0.0.0-20200625203802-6e8e738ad208/go.mod"
	"golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190502145724-3ef323f4f1fd/go.mod"
	"golang.org/x/sys v0.0.0-20190507160741-ecd444e8653b/go.mod"
	"golang.org/x/sys v0.0.0-20190606165138-5da285871e9c/go.mod"
	"golang.org/x/sys v0.0.0-20190624142023-c5567b49c5d0/go.mod"
	"golang.org/x/sys v0.0.0-20190726091711-fc99dfbffb4e/go.mod"
	"golang.org/x/sys v0.0.0-20191001151750-bb3f8db39f24/go.mod"
	"golang.org/x/sys v0.0.0-20191204072324-ce4227a45e2e/go.mod"
	"golang.org/x/sys v0.0.0-20191228213918-04cbcbbfeed8/go.mod"
	"golang.org/x/sys v0.0.0-20200113162924-86b910548bc1/go.mod"
	"golang.org/x/sys v0.0.0-20200122134326-e047566fdf82/go.mod"
	"golang.org/x/sys v0.0.0-20200202164722-d101bd2416d5/go.mod"
	"golang.org/x/sys v0.0.0-20200212091648-12a6c2dcc1e4/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20200302150141-5c8b2ff67527/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/sys v0.0.0-20200331124033-c3d80250170d/go.mod"
	"golang.org/x/sys v0.0.0-20200501052902-10377860bb8e/go.mod"
	"golang.org/x/sys v0.0.0-20200511232937-7e40ca221e25/go.mod"
	"golang.org/x/sys v0.0.0-20200515095857-1151b9dac4a9/go.mod"
	"golang.org/x/sys v0.0.0-20200523222454-059865788121/go.mod"
	"golang.org/x/sys v0.0.0-20200803210538-64077c9b5642/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20211025201205-69cdffdb9359/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.0.0-20220731174439-a90be440212d/go.mod"
	"golang.org/x/sys v0.1.0/go.mod"
	"golang.org/x/sys v0.5.0/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.31.0"
	"golang.org/x/sys v0.31.0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.3.8/go.mod"
	"golang.org/x/text v0.23.0"
	"golang.org/x/text v0.23.0/go.mod"
	"golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/time v0.0.0-20191024005414-555d28b269f0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190312151545-0bb0c0a6e846/go.mod"
	"golang.org/x/tools v0.0.0-20190312170243-e65039ee4138/go.mod"
	"golang.org/x/tools v0.0.0-20190425150028-36563e24a262/go.mod"
	"golang.org/x/tools v0.0.0-20190506145303-2d16b83fe98c/go.mod"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135/go.mod"
	"golang.org/x/tools v0.0.0-20190606124116-d0a3d012864b/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20190628153133-6cdbf07be9d0/go.mod"
	"golang.org/x/tools v0.0.0-20190816200558-6889da9d5479/go.mod"
	"golang.org/x/tools v0.0.0-20190911174233-4f2ddba30aff/go.mod"
	"golang.org/x/tools v0.0.0-20191012152004-8de300cfc20a/go.mod"
	"golang.org/x/tools v0.0.0-20191113191852-77e3bb0ad9e7/go.mod"
	"golang.org/x/tools v0.0.0-20191115202509-3a792d9c32b2/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20191125144606-a911d9008d1f/go.mod"
	"golang.org/x/tools v0.0.0-20191130070609-6e064ea0cf2d/go.mod"
	"golang.org/x/tools v0.0.0-20191216173652-a0e659d51361/go.mod"
	"golang.org/x/tools v0.0.0-20191227053925-7b8e75db28f4/go.mod"
	"golang.org/x/tools v0.0.0-20200117161641-43d50277825c/go.mod"
	"golang.org/x/tools v0.0.0-20200122220014-bf1340f18c4a/go.mod"
	"golang.org/x/tools v0.0.0-20200130002326-2f3ba24bd6e7/go.mod"
	"golang.org/x/tools v0.0.0-20200204074204-1cc6d1ef6c74/go.mod"
	"golang.org/x/tools v0.0.0-20200207183749-b753a1ba74fa/go.mod"
	"golang.org/x/tools v0.0.0-20200212150539-ea181f53ac56/go.mod"
	"golang.org/x/tools v0.0.0-20200224181240-023911ca70b2/go.mod"
	"golang.org/x/tools v0.0.0-20200227222343-706bc42d1f0d/go.mod"
	"golang.org/x/tools v0.0.0-20200304193943-95d2e580d8eb/go.mod"
	"golang.org/x/tools v0.0.0-20200312045724-11d5b4c81c7d/go.mod"
	"golang.org/x/tools v0.0.0-20200331025713-a30bf2db82d4/go.mod"
	"golang.org/x/tools v0.0.0-20200501065659-ab2804fb9c9d/go.mod"
	"golang.org/x/tools v0.0.0-20200512131952-2bc93b1c0c88/go.mod"
	"golang.org/x/tools v0.0.0-20200515010526-7d3b6ebf133d/go.mod"
	"golang.org/x/tools v0.0.0-20200618134242-20370b0cb4b2/go.mod"
	"golang.org/x/tools v0.0.0-20200729194436-6467de6f59a7/go.mod"
	"golang.org/x/tools v0.0.0-20200804011535-6c149bb5ef0d/go.mod"
	"golang.org/x/tools v0.0.0-20200825202427-b303f430e36d/go.mod"
	"golang.org/x/tools v0.0.0-20201223200349-f6952e403d3f/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"golang.org/x/xerrors v0.0.0-20231012003039-104605ab7028"
	"golang.org/x/xerrors v0.0.0-20231012003039-104605ab7028/go.mod"
	"google.golang.org/api v0.4.0/go.mod"
	"google.golang.org/api v0.7.0/go.mod"
	"google.golang.org/api v0.8.0/go.mod"
	"google.golang.org/api v0.9.0/go.mod"
	"google.golang.org/api v0.13.0/go.mod"
	"google.golang.org/api v0.14.0/go.mod"
	"google.golang.org/api v0.15.0/go.mod"
	"google.golang.org/api v0.17.0/go.mod"
	"google.golang.org/api v0.18.0/go.mod"
	"google.golang.org/api v0.19.0/go.mod"
	"google.golang.org/api v0.20.0/go.mod"
	"google.golang.org/api v0.22.0/go.mod"
	"google.golang.org/api v0.24.0/go.mod"
	"google.golang.org/api v0.28.0/go.mod"
	"google.golang.org/api v0.29.0/go.mod"
	"google.golang.org/api v0.30.0/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.5.0/go.mod"
	"google.golang.org/appengine v1.6.1/go.mod"
	"google.golang.org/appengine v1.6.5/go.mod"
	"google.golang.org/appengine v1.6.6/go.mod"
	"google.golang.org/appengine v1.6.8"
	"google.golang.org/appengine v1.6.8/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19/go.mod"
	"google.golang.org/genproto v0.0.0-20190418145605-e7d98fc518a7/go.mod"
	"google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb/go.mod"
	"google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873/go.mod"
	"google.golang.org/genproto v0.0.0-20190801165951-fa694d86fc64/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20190911173649-1774047e7e51/go.mod"
	"google.golang.org/genproto v0.0.0-20191108220845-16a3f7862a1a/go.mod"
	"google.golang.org/genproto v0.0.0-20191115194625-c23dd37a84c9/go.mod"
	"google.golang.org/genproto v0.0.0-20191216164720-4f79533eabd1/go.mod"
	"google.golang.org/genproto v0.0.0-20191230161307-f3c370f40bfb/go.mod"
	"google.golang.org/genproto v0.0.0-20200115191322-ca5a22157cba/go.mod"
	"google.golang.org/genproto v0.0.0-20200122232147-0452cf42e150/go.mod"
	"google.golang.org/genproto v0.0.0-20200204135345-fa8e72b47b90/go.mod"
	"google.golang.org/genproto v0.0.0-20200212174721-66ed5ce911ce/go.mod"
	"google.golang.org/genproto v0.0.0-20200224152610-e50cd9704f63/go.mod"
	"google.golang.org/genproto v0.0.0-20200228133532-8c2c7df3a383/go.mod"
	"google.golang.org/genproto v0.0.0-20200305110556-506484158171/go.mod"
	"google.golang.org/genproto v0.0.0-20200312145019-da6875a35672/go.mod"
	"google.golang.org/genproto v0.0.0-20200331122359-1ee6d9798940/go.mod"
	"google.golang.org/genproto v0.0.0-20200430143042-b979b6f78d84/go.mod"
	"google.golang.org/genproto v0.0.0-20200511104702-f5ebc3bea380/go.mod"
	"google.golang.org/genproto v0.0.0-20200515170657-fc4c6c6a6587/go.mod"
	"google.golang.org/genproto v0.0.0-20200526211855-cb27e3aa2013/go.mod"
	"google.golang.org/genproto v0.0.0-20200618031413-b414f8b61790/go.mod"
	"google.golang.org/genproto v0.0.0-20200729003335-053ba62fc06f/go.mod"
	"google.golang.org/genproto v0.0.0-20200804131852-c06518451d9c/go.mod"
	"google.golang.org/genproto v0.0.0-20200825200019-8632dd797987/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.20.1/go.mod"
	"google.golang.org/grpc v1.21.1/go.mod"
	"google.golang.org/grpc v1.23.0/go.mod"
	"google.golang.org/grpc v1.25.1/go.mod"
	"google.golang.org/grpc v1.26.0/go.mod"
	"google.golang.org/grpc v1.27.0/go.mod"
	"google.golang.org/grpc v1.27.1/go.mod"
	"google.golang.org/grpc v1.28.0/go.mod"
	"google.golang.org/grpc v1.29.1/go.mod"
	"google.golang.org/grpc v1.30.0/go.mod"
	"google.golang.org/grpc v1.31.0/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.22.0/go.mod"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"google.golang.org/protobuf v1.23.1-0.20200526195155-81db48ad09cc/go.mod"
	"google.golang.org/protobuf v1.24.0/go.mod"
	"google.golang.org/protobuf v1.25.0/go.mod"
	"google.golang.org/protobuf v1.26.0-rc.1/go.mod"
	"google.golang.org/protobuf v1.26.0/go.mod"
	"google.golang.org/protobuf v1.33.0"
	"google.golang.org/protobuf v1.33.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f"
	"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod"
	"honnef.co/go/tools v0.0.0-20190418001031-e561f6794a2a/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"honnef.co/go/tools v0.0.1-2020.1.3/go.mod"
	"honnef.co/go/tools v0.0.1-2020.1.4/go.mod"
	"nullprogram.com/x/optparse v1.0.0/go.mod"
	"rsc.io/binaryregexp v0.2.0/go.mod"
	"rsc.io/pdf v0.1.1/go.mod"
	"rsc.io/quote/v3 v3.1.0/go.mod"
	"rsc.io/sampler v1.3.0/go.mod"
)
go-module_set_globals

# Web UI dependencies, one distfile per npm tarball.
# Generated with: scripts/npm-src-uri.py ui/pnpm-lock.yaml
NPM_SRC_URI="
	https://registry.npmjs.org/@babel/runtime/-/runtime-7.26.0.tgz
		-> npm-@babel+runtime-7.26.0.tgz.npm
	https://registry.npmjs.org/@babel/runtime/-/runtime-7.29.2.tgz
		-> npm-@babel+runtime-7.29.2.tgz.npm
	https://registry.npmjs.org/@bufbuild/protobuf/-/protobuf-2.2.2.tgz
		-> npm-@bufbuild+protobuf-2.2.2.tgz.npm
	https://registry.npmjs.org/@eslint-community/eslint-utils/-/eslint-utils-4.4.1.tgz
		-> npm-@eslint-community+eslint-utils-4.4.1.tgz.npm
	https://registry.npmjs.org/@eslint-community/regexpp/-/regexpp-4.12.1.tgz
		-> npm-@eslint-community+regexpp-4.12.1.tgz.npm
	https://registry.npmjs.org/@eslint/config-array/-/config-array-0.19.0.tgz
		-> npm-@eslint+config-array-0.19.0.tgz.npm
	https://registry.npmjs.org/@eslint/core/-/core-0.9.0.tgz
		-> npm-@eslint+core-0.9.0.tgz.npm
	https://registry.npmjs.org/@eslint/eslintrc/-/eslintrc-3.2.0.tgz
		-> npm-@eslint+eslintrc-3.2.0.tgz.npm
	https://registry.npmjs.org/@eslint/js/-/js-9.15.0.tgz
		-> npm-@eslint+js-9.15.0.tgz.npm
	https://registry.npmjs.org/@eslint/object-schema/-/object-schema-2.1.4.tgz
		-> npm-@eslint+object-schema-2.1.4.tgz.npm
	https://registry.npmjs.org/@eslint/plugin-kit/-/plugin-kit-0.2.3.tgz
		-> npm-@eslint+plugin-kit-0.2.3.tgz.npm
	https://registry.npmjs.org/@humanfs/core/-/core-0.19.1.tgz
		-> npm-@humanfs+core-0.19.1.tgz.npm
	https://registry.npmjs.org/@humanfs/node/-/node-0.16.6.tgz
		-> npm-@humanfs+node-0.16.6.tgz.npm
	https://registry.npmjs.org/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz
		-> npm-@humanwhocodes+module-importer-1.0.1.tgz.npm
	https://registry.npmjs.org/@humanwhocodes/retry/-/retry-0.3.1.tgz
		-> npm-@humanwhocodes+retry-0.3.1.tgz.npm
	https://registry.npmjs.org/@humanwhocodes/retry/-/retry-0.4.1.tgz
		-> npm-@humanwhocodes+retry-0.4.1.tgz.npm
	https://registry.npmjs.org/@mapbox/node-pre-gyp/-/node-pre-gyp-1.0.11.tgz
		-> npm-@mapbox+node-pre-gyp-1.0.11.tgz.npm
	https://registry.npmjs.org/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz
		-> npm-@nodelib+fs.scandir-2.1.5.tgz.npm
	https://registry.npmjs.org/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz
		-> npm-@nodelib+fs.stat-2.0.5.tgz.npm
	https://registry.npmjs.org/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz
		-> npm-@nodelib+fs.walk-1.2.8.tgz.npm
	https://registry.npmjs.org/@popperjs/core/-/core-2.11.8.tgz
		-> npm-@popperjs+core-2.11.8.tgz.npm
	https://registry.npmjs.org/@react-aria/ssr/-/ssr-3.9.6.tgz
		-> npm-@react-aria+ssr-3.9.6.tgz.npm
	https://registry.npmjs.org/@react-dnd/asap/-/asap-4.0.1.tgz
		-> npm-@react-dnd+asap-4.0.1.tgz.npm
	https://registry.npmjs.org/@react-dnd/invariant/-/invariant-2.0.0.tgz
		-> npm-@react-dnd+invariant-2.0.0.tgz.npm
	https://registry.npmjs.org/@react-dnd/shallowequal/-/shallowequal-2.0.0.tgz
		-> npm-@react-dnd+shallowequal-2.0.0.tgz.npm
	https://registry.npmjs.org/@restart/hooks/-/hooks-0.4.16.tgz
		-> npm-@restart+hooks-0.4.16.tgz.npm
	https://registry.npmjs.org/@restart/ui/-/ui-1.8.0.tgz
		-> npm-@restart+ui-1.8.0.tgz.npm
	https://registry.npmjs.org/@swc/core/-/core-1.9.2.tgz
		-> npm-@swc+core-1.9.2.tgz.npm
	https://registry.npmjs.org/@swc/counter/-/counter-0.1.3.tgz
		-> npm-@swc+counter-0.1.3.tgz.npm
	https://registry.npmjs.org/@swc/helpers/-/helpers-0.5.15.tgz
		-> npm-@swc+helpers-0.5.15.tgz.npm
	https://registry.npmjs.org/@swc/types/-/types-0.1.15.tgz
		-> npm-@swc+types-0.1.15.tgz.npm
	https://registry.npmjs.org/@tanstack/react-table/-/react-table-8.21.3.tgz
		-> npm-@tanstack+react-table-8.21.3.tgz.npm
	https://registry.npmjs.org/@tanstack/table-core/-/table-core-8.21.3.tgz
		-> npm-@tanstack+table-core-8.21.3.tgz.npm
	https://registry.npmjs.org/@types/estree/-/estree-1.0.6.tgz
		-> npm-@types+estree-1.0.6.tgz.npm
	https://registry.npmjs.org/@types/estree/-/estree-1.0.8.tgz
		-> npm-@types+estree-1.0.8.tgz.npm
	https://registry.npmjs.org/@types/json-schema/-/json-schema-7.0.15.tgz
		-> npm-@types+json-schema-7.0.15.tgz.npm
	https://registry.npmjs.org/@types/node/-/node-25.5.0.tgz
		-> npm-@types+node-25.5.0.tgz.npm
	https://registry.npmjs.org/@types/prop-types/-/prop-types-15.7.13.tgz
		-> npm-@types+prop-types-15.7.13.tgz.npm
	https://registry.npmjs.org/@types/react-dom/-/react-dom-18.3.1.tgz
		-> npm-@types+react-dom-18.3.1.tgz.npm
	https://registry.npmjs.org/@types/react-transition-group/-/react-transition-group-4.4.11.tgz
		-> npm-@types+react-transition-group-4.4.11.tgz.npm
	https://registry.npmjs.org/@types/react/-/react-18.3.12.tgz
		-> npm-@types+react-18.3.12.tgz.npm
	https://registry.npmjs.org/@types/readable-stream/-/readable-stream-4.0.23.tgz
		-> npm-@types+readable-stream-4.0.23.tgz.npm
	https://registry.npmjs.org/@types/warning/-/warning-3.0.3.tgz
		-> npm-@types+warning-3.0.3.tgz.npm
	https://registry.npmjs.org/@types/ws/-/ws-8.18.1.tgz
		-> npm-@types+ws-8.18.1.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/eslint-plugin/-/eslint-plugin-8.15.0.tgz
		-> npm-@typescript-eslint+eslint-plugin-8.15.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/parser/-/parser-8.15.0.tgz
		-> npm-@typescript-eslint+parser-8.15.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/scope-manager/-/scope-manager-8.15.0.tgz
		-> npm-@typescript-eslint+scope-manager-8.15.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/type-utils/-/type-utils-8.15.0.tgz
		-> npm-@typescript-eslint+type-utils-8.15.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/types/-/types-8.15.0.tgz
		-> npm-@typescript-eslint+types-8.15.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/typescript-estree/-/typescript-estree-8.15.0.tgz
		-> npm-@typescript-eslint+typescript-estree-8.15.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/utils/-/utils-8.15.0.tgz
		-> npm-@typescript-eslint+utils-8.15.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/visitor-keys/-/visitor-keys-8.15.0.tgz
		-> npm-@typescript-eslint+visitor-keys-8.15.0.tgz.npm
	https://registry.npmjs.org/@vitejs/plugin-react-swc/-/plugin-react-swc-3.7.1.tgz
		-> npm-@vitejs+plugin-react-swc-3.7.1.tgz.npm
	https://registry.npmjs.org/abbrev/-/abbrev-1.1.1.tgz
		-> npm-abbrev-1.1.1.tgz.npm
	https://registry.npmjs.org/abort-controller/-/abort-controller-3.0.0.tgz
		-> npm-abort-controller-3.0.0.tgz.npm
	https://registry.npmjs.org/acorn-jsx/-/acorn-jsx-5.3.2.tgz
		-> npm-acorn-jsx-5.3.2.tgz.npm
	https://registry.npmjs.org/acorn/-/acorn-8.14.0.tgz
		-> npm-acorn-8.14.0.tgz.npm
	https://registry.npmjs.org/agent-base/-/agent-base-6.0.2.tgz
		-> npm-agent-base-6.0.2.tgz.npm
	https://registry.npmjs.org/ajv/-/ajv-6.12.6.tgz
		-> npm-ajv-6.12.6.tgz.npm
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz
		-> npm-ansi-regex-5.0.1.tgz.npm
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz
		-> npm-ansi-styles-4.3.0.tgz.npm
	https://registry.npmjs.org/anymatch/-/anymatch-3.1.3.tgz
		-> npm-anymatch-3.1.3.tgz.npm
	https://registry.npmjs.org/aproba/-/aproba-2.0.0.tgz
		-> npm-aproba-2.0.0.tgz.npm
	https://registry.npmjs.org/are-we-there-yet/-/are-we-there-yet-2.0.0.tgz
		-> npm-are-we-there-yet-2.0.0.tgz.npm
	https://registry.npmjs.org/argparse/-/argparse-2.0.1.tgz
		-> npm-argparse-2.0.1.tgz.npm
	https://registry.npmjs.org/attr-accept/-/attr-accept-2.2.5.tgz
		-> npm-attr-accept-2.2.5.tgz.npm
	https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz
		-> npm-balanced-match-1.0.2.tgz.npm
	https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz
		-> npm-base64-js-1.5.1.tgz.npm
	https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.3.0.tgz
		-> npm-binary-extensions-2.3.0.tgz.npm
	https://registry.npmjs.org/bl/-/bl-6.1.6.tgz
		-> npm-bl-6.1.6.tgz.npm
	https://registry.npmjs.org/bootstrap/-/bootstrap-5.3.3.tgz
		-> npm-bootstrap-5.3.3.tgz.npm
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz
		-> npm-brace-expansion-1.1.11.tgz.npm
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-2.0.1.tgz
		-> npm-brace-expansion-2.0.1.tgz.npm
	https://registry.npmjs.org/braces/-/braces-3.0.3.tgz
		-> npm-braces-3.0.3.tgz.npm
	https://registry.npmjs.org/broker-factory/-/broker-factory-3.1.14.tgz
		-> npm-broker-factory-3.1.14.tgz.npm
	https://registry.npmjs.org/buffer-builder/-/buffer-builder-0.2.0.tgz
		-> npm-buffer-builder-0.2.0.tgz.npm
	https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz
		-> npm-buffer-from-1.1.2.tgz.npm
	https://registry.npmjs.org/buffer/-/buffer-6.0.3.tgz
		-> npm-buffer-6.0.3.tgz.npm
	https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz
		-> npm-callsites-3.1.0.tgz.npm
	https://registry.npmjs.org/canvas/-/canvas-2.11.2.tgz
		-> npm-canvas-2.11.2.tgz.npm
	https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz
		-> npm-chalk-4.1.2.tgz.npm
	https://registry.npmjs.org/chokidar/-/chokidar-3.6.0.tgz
		-> npm-chokidar-3.6.0.tgz.npm
	https://registry.npmjs.org/chownr/-/chownr-2.0.0.tgz
		-> npm-chownr-2.0.0.tgz.npm
	https://registry.npmjs.org/classnames/-/classnames-2.5.1.tgz
		-> npm-classnames-2.5.1.tgz.npm
	https://registry.npmjs.org/clsx/-/clsx-2.1.1.tgz
		-> npm-clsx-2.1.1.tgz.npm
	https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz
		-> npm-color-convert-2.0.1.tgz.npm
	https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz
		-> npm-color-name-1.1.4.tgz.npm
	https://registry.npmjs.org/color-support/-/color-support-1.1.3.tgz
		-> npm-color-support-1.1.3.tgz.npm
	https://registry.npmjs.org/colorjs.io/-/colorjs.io-0.5.2.tgz
		-> npm-colorjs.io-0.5.2.tgz.npm
	https://registry.npmjs.org/commist/-/commist-3.2.0.tgz
		-> npm-commist-3.2.0.tgz.npm
	https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz
		-> npm-concat-map-0.0.1.tgz.npm
	https://registry.npmjs.org/concat-stream/-/concat-stream-2.0.0.tgz
		-> npm-concat-stream-2.0.0.tgz.npm
	https://registry.npmjs.org/console-control-strings/-/console-control-strings-1.1.0.tgz
		-> npm-console-control-strings-1.1.0.tgz.npm
	https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.6.tgz
		-> npm-cross-spawn-7.0.6.tgz.npm
	https://registry.npmjs.org/csstype/-/csstype-3.1.3.tgz
		-> npm-csstype-3.1.3.tgz.npm
	https://registry.npmjs.org/debug/-/debug-4.3.7.tgz
		-> npm-debug-4.3.7.tgz.npm
	https://registry.npmjs.org/debug/-/debug-4.4.3.tgz
		-> npm-debug-4.4.3.tgz.npm
	https://registry.npmjs.org/decompress-response/-/decompress-response-4.2.1.tgz
		-> npm-decompress-response-4.2.1.tgz.npm
	https://registry.npmjs.org/deep-is/-/deep-is-0.1.4.tgz
		-> npm-deep-is-0.1.4.tgz.npm
	https://registry.npmjs.org/delegates/-/delegates-1.0.0.tgz
		-> npm-delegates-1.0.0.tgz.npm
	https://registry.npmjs.org/dequal/-/dequal-2.0.3.tgz
		-> npm-dequal-2.0.3.tgz.npm
	https://registry.npmjs.org/detect-libc/-/detect-libc-2.0.3.tgz
		-> npm-detect-libc-2.0.3.tgz.npm
	https://registry.npmjs.org/dnd-core/-/dnd-core-14.0.1.tgz
		-> npm-dnd-core-14.0.1.tgz.npm
	https://registry.npmjs.org/dom-helpers/-/dom-helpers-5.2.1.tgz
		-> npm-dom-helpers-5.2.1.tgz.npm
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz
		-> npm-emoji-regex-8.0.0.tgz.npm
	https://registry.npmjs.org/esbuild/-/esbuild-0.21.5.tgz
		-> npm-esbuild-0.21.5.tgz.npm
	https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
		-> npm-escape-string-regexp-4.0.0.tgz.npm
	https://registry.npmjs.org/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-5.0.0.tgz
		-> npm-eslint-plugin-react-hooks-5.0.0.tgz.npm
	https://registry.npmjs.org/eslint-plugin-react-refresh/-/eslint-plugin-react-refresh-0.4.14.tgz
		-> npm-eslint-plugin-react-refresh-0.4.14.tgz.npm
	https://registry.npmjs.org/eslint-scope/-/eslint-scope-8.2.0.tgz
		-> npm-eslint-scope-8.2.0.tgz.npm
	https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
		-> npm-eslint-visitor-keys-3.4.3.tgz.npm
	https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-4.2.0.tgz
		-> npm-eslint-visitor-keys-4.2.0.tgz.npm
	https://registry.npmjs.org/eslint/-/eslint-9.15.0.tgz
		-> npm-eslint-9.15.0.tgz.npm
	https://registry.npmjs.org/espree/-/espree-10.3.0.tgz
		-> npm-espree-10.3.0.tgz.npm
	https://registry.npmjs.org/esquery/-/esquery-1.6.0.tgz
		-> npm-esquery-1.6.0.tgz.npm
	https://registry.npmjs.org/esrecurse/-/esrecurse-4.3.0.tgz
		-> npm-esrecurse-4.3.0.tgz.npm
	https://registry.npmjs.org/estraverse/-/estraverse-5.3.0.tgz
		-> npm-estraverse-5.3.0.tgz.npm
	https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz
		-> npm-esutils-2.0.3.tgz.npm
	https://registry.npmjs.org/event-target-shim/-/event-target-shim-5.0.1.tgz
		-> npm-event-target-shim-5.0.1.tgz.npm
	https://registry.npmjs.org/events/-/events-3.3.0.tgz
		-> npm-events-3.3.0.tgz.npm
	https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
		-> npm-fast-deep-equal-3.1.3.tgz.npm
	https://registry.npmjs.org/fast-glob/-/fast-glob-3.3.2.tgz
		-> npm-fast-glob-3.3.2.tgz.npm
	https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
		-> npm-fast-json-stable-stringify-2.1.0.tgz.npm
	https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
		-> npm-fast-levenshtein-2.0.6.tgz.npm
	https://registry.npmjs.org/fast-unique-numbers/-/fast-unique-numbers-9.0.27.tgz
		-> npm-fast-unique-numbers-9.0.27.tgz.npm
	https://registry.npmjs.org/fastq/-/fastq-1.17.1.tgz
		-> npm-fastq-1.17.1.tgz.npm
	https://registry.npmjs.org/file-entry-cache/-/file-entry-cache-8.0.0.tgz
		-> npm-file-entry-cache-8.0.0.tgz.npm
	https://registry.npmjs.org/file-selector/-/file-selector-2.1.0.tgz
		-> npm-file-selector-2.1.0.tgz.npm
	https://registry.npmjs.org/fill-range/-/fill-range-7.1.1.tgz
		-> npm-fill-range-7.1.1.tgz.npm
	https://registry.npmjs.org/find-up/-/find-up-5.0.0.tgz
		-> npm-find-up-5.0.0.tgz.npm
	https://registry.npmjs.org/flat-cache/-/flat-cache-4.0.1.tgz
		-> npm-flat-cache-4.0.1.tgz.npm
	https://registry.npmjs.org/flatted/-/flatted-3.3.2.tgz
		-> npm-flatted-3.3.2.tgz.npm
	https://registry.npmjs.org/fs-minipass/-/fs-minipass-2.1.0.tgz
		-> npm-fs-minipass-2.1.0.tgz.npm
	https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz
		-> npm-fs.realpath-1.0.0.tgz.npm
	https://registry.npmjs.org/gauge/-/gauge-3.0.2.tgz
		-> npm-gauge-3.0.2.tgz.npm
	https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz
		-> npm-glob-parent-5.1.2.tgz.npm
	https://registry.npmjs.org/glob-parent/-/glob-parent-6.0.2.tgz
		-> npm-glob-parent-6.0.2.tgz.npm
	https://registry.npmjs.org/glob/-/glob-7.2.3.tgz
		-> npm-glob-7.2.3.tgz.npm
	https://registry.npmjs.org/globals/-/globals-14.0.0.tgz
		-> npm-globals-14.0.0.tgz.npm
	https://registry.npmjs.org/globals/-/globals-15.12.0.tgz
		-> npm-globals-15.12.0.tgz.npm
	https://registry.npmjs.org/graphemer/-/graphemer-1.4.0.tgz
		-> npm-graphemer-1.4.0.tgz.npm
	https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz
		-> npm-has-flag-4.0.0.tgz.npm
	https://registry.npmjs.org/has-unicode/-/has-unicode-2.0.1.tgz
		-> npm-has-unicode-2.0.1.tgz.npm
	https://registry.npmjs.org/help-me/-/help-me-5.0.0.tgz
		-> npm-help-me-5.0.0.tgz.npm
	https://registry.npmjs.org/history/-/history-4.10.1.tgz
		-> npm-history-4.10.1.tgz.npm
	https://registry.npmjs.org/hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz
		-> npm-hoist-non-react-statics-3.3.2.tgz.npm
	https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz
		-> npm-https-proxy-agent-5.0.1.tgz.npm
	https://registry.npmjs.org/ieee754/-/ieee754-1.2.1.tgz
		-> npm-ieee754-1.2.1.tgz.npm
	https://registry.npmjs.org/ignore/-/ignore-5.3.2.tgz
		-> npm-ignore-5.3.2.tgz.npm
	https://registry.npmjs.org/immutable/-/immutable-4.3.7.tgz
		-> npm-immutable-4.3.7.tgz.npm
	https://registry.npmjs.org/immutable/-/immutable-5.0.3.tgz
		-> npm-immutable-5.0.3.tgz.npm
	https://registry.npmjs.org/import-fresh/-/import-fresh-3.3.0.tgz
		-> npm-import-fresh-3.3.0.tgz.npm
	https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz
		-> npm-imurmurhash-0.1.4.tgz.npm
	https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz
		-> npm-inflight-1.0.6.tgz.npm
	https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz
		-> npm-inherits-2.0.4.tgz.npm
	https://registry.npmjs.org/invariant/-/invariant-2.2.4.tgz
		-> npm-invariant-2.2.4.tgz.npm
	https://registry.npmjs.org/ip-address/-/ip-address-10.1.0.tgz
		-> npm-ip-address-10.1.0.tgz.npm
	https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz
		-> npm-is-binary-path-2.1.0.tgz.npm
	https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz
		-> npm-is-extglob-2.1.1.tgz.npm
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
		-> npm-is-fullwidth-code-point-3.0.0.tgz.npm
	https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz
		-> npm-is-glob-4.0.3.tgz.npm
	https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz
		-> npm-is-number-7.0.0.tgz.npm
	https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz
		-> npm-isarray-0.0.1.tgz.npm
	https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz
		-> npm-isexe-2.0.0.tgz.npm
	https://registry.npmjs.org/js-sdsl/-/js-sdsl-4.3.0.tgz
		-> npm-js-sdsl-4.3.0.tgz.npm
	https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz
		-> npm-js-tokens-4.0.0.tgz.npm
	https://registry.npmjs.org/js-yaml/-/js-yaml-4.1.0.tgz
		-> npm-js-yaml-4.1.0.tgz.npm
	https://registry.npmjs.org/json-buffer/-/json-buffer-3.0.1.tgz
		-> npm-json-buffer-3.0.1.tgz.npm
	https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
		-> npm-json-schema-traverse-0.4.1.tgz.npm
	https://registry.npmjs.org/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
		-> npm-json-stable-stringify-without-jsonify-1.0.1.tgz.npm
	https://registry.npmjs.org/jwt-decode/-/jwt-decode-4.0.0.tgz
		-> npm-jwt-decode-4.0.0.tgz.npm
	https://registry.npmjs.org/keyv/-/keyv-4.5.4.tgz
		-> npm-keyv-4.5.4.tgz.npm
	https://registry.npmjs.org/levn/-/levn-0.4.1.tgz
		-> npm-levn-0.4.1.tgz.npm
	https://registry.npmjs.org/locate-path/-/locate-path-6.0.0.tgz
		-> npm-locate-path-6.0.0.tgz.npm
	https://registry.npmjs.org/lodash.merge/-/lodash.merge-4.6.2.tgz
		-> npm-lodash.merge-4.6.2.tgz.npm
	https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz
		-> npm-loose-envify-1.4.0.tgz.npm
	https://registry.npmjs.org/lru-cache/-/lru-cache-10.4.3.tgz
		-> npm-lru-cache-10.4.3.tgz.npm
	https://registry.npmjs.org/make-cancellable-promise/-/make-cancellable-promise-1.3.2.tgz
		-> npm-make-cancellable-promise-1.3.2.tgz.npm
	https://registry.npmjs.org/make-dir/-/make-dir-3.1.0.tgz
		-> npm-make-dir-3.1.0.tgz.npm
	https://registry.npmjs.org/make-event-props/-/make-event-props-1.6.2.tgz
		-> npm-make-event-props-1.6.2.tgz.npm
	https://registry.npmjs.org/memoize-one/-/memoize-one-5.2.1.tgz
		-> npm-memoize-one-5.2.1.tgz.npm
	https://registry.npmjs.org/merge-refs/-/merge-refs-1.3.0.tgz
		-> npm-merge-refs-1.3.0.tgz.npm
	https://registry.npmjs.org/merge2/-/merge2-1.4.1.tgz
		-> npm-merge2-1.4.1.tgz.npm
	https://registry.npmjs.org/micromatch/-/micromatch-4.0.8.tgz
		-> npm-micromatch-4.0.8.tgz.npm
	https://registry.npmjs.org/mimic-response/-/mimic-response-2.1.0.tgz
		-> npm-mimic-response-2.1.0.tgz.npm
	https://registry.npmjs.org/minimatch/-/minimatch-3.1.2.tgz
		-> npm-minimatch-3.1.2.tgz.npm
	https://registry.npmjs.org/minimatch/-/minimatch-9.0.5.tgz
		-> npm-minimatch-9.0.5.tgz.npm
	https://registry.npmjs.org/minimist/-/minimist-1.2.8.tgz
		-> npm-minimist-1.2.8.tgz.npm
	https://registry.npmjs.org/minipass/-/minipass-3.3.6.tgz
		-> npm-minipass-3.3.6.tgz.npm
	https://registry.npmjs.org/minipass/-/minipass-5.0.0.tgz
		-> npm-minipass-5.0.0.tgz.npm
	https://registry.npmjs.org/minizlib/-/minizlib-2.1.2.tgz
		-> npm-minizlib-2.1.2.tgz.npm
	https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz
		-> npm-mkdirp-1.0.4.tgz.npm
	https://registry.npmjs.org/moment/-/moment-2.30.1.tgz
		-> npm-moment-2.30.1.tgz.npm
	https://registry.npmjs.org/mqtt-packet/-/mqtt-packet-9.0.2.tgz
		-> npm-mqtt-packet-9.0.2.tgz.npm
	https://registry.npmjs.org/mqtt/-/mqtt-5.15.1.tgz
		-> npm-mqtt-5.15.1.tgz.npm
	https://registry.npmjs.org/ms/-/ms-2.1.3.tgz
		-> npm-ms-2.1.3.tgz.npm
	https://registry.npmjs.org/nan/-/nan-2.22.0.tgz
		-> npm-nan-2.22.0.tgz.npm
	https://registry.npmjs.org/nanoid/-/nanoid-3.3.11.tgz
		-> npm-nanoid-3.3.11.tgz.npm
	https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz
		-> npm-natural-compare-1.4.0.tgz.npm
	https://registry.npmjs.org/node-fetch/-/node-fetch-2.7.0.tgz
		-> npm-node-fetch-2.7.0.tgz.npm
	https://registry.npmjs.org/nopt/-/nopt-5.0.0.tgz
		-> npm-nopt-5.0.0.tgz.npm
	https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz
		-> npm-normalize-path-3.0.0.tgz.npm
	https://registry.npmjs.org/npmlog/-/npmlog-5.0.1.tgz
		-> npm-npmlog-5.0.1.tgz.npm
	https://registry.npmjs.org/number-allocator/-/number-allocator-1.0.14.tgz
		-> npm-number-allocator-1.0.14.tgz.npm
	https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz
		-> npm-object-assign-4.1.1.tgz.npm
	https://registry.npmjs.org/once/-/once-1.4.0.tgz
		-> npm-once-1.4.0.tgz.npm
	https://registry.npmjs.org/optionator/-/optionator-0.9.4.tgz
		-> npm-optionator-0.9.4.tgz.npm
	https://registry.npmjs.org/p-limit/-/p-limit-3.1.0.tgz
		-> npm-p-limit-3.1.0.tgz.npm
	https://registry.npmjs.org/p-locate/-/p-locate-5.0.0.tgz
		-> npm-p-locate-5.0.0.tgz.npm
	https://registry.npmjs.org/pako/-/pako-1.0.11.tgz
		-> npm-pako-1.0.11.tgz.npm
	https://registry.npmjs.org/parent-module/-/parent-module-1.0.1.tgz
		-> npm-parent-module-1.0.1.tgz.npm
	https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz
		-> npm-path-exists-4.0.0.tgz.npm
	https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz
		-> npm-path-is-absolute-1.0.1.tgz.npm
	https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz
		-> npm-path-key-3.1.1.tgz.npm
	https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-1.9.0.tgz
		-> npm-path-to-regexp-1.9.0.tgz.npm
	https://registry.npmjs.org/path2d/-/path2d-0.2.2.tgz
		-> npm-path2d-0.2.2.tgz.npm
	https://registry.npmjs.org/pdfjs-dist/-/pdfjs-dist-4.4.168.tgz
		-> npm-pdfjs-dist-4.4.168.tgz.npm
	https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz
		-> npm-picocolors-1.1.1.tgz.npm
	https://registry.npmjs.org/picomatch/-/picomatch-2.3.1.tgz
		-> npm-picomatch-2.3.1.tgz.npm
	https://registry.npmjs.org/postcss/-/postcss-8.5.6.tgz
		-> npm-postcss-8.5.6.tgz.npm
	https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.2.1.tgz
		-> npm-prelude-ls-1.2.1.tgz.npm
	https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.1.tgz
		-> npm-process-nextick-args-2.0.1.tgz.npm
	https://registry.npmjs.org/process/-/process-0.11.10.tgz
		-> npm-process-0.11.10.tgz.npm
	https://registry.npmjs.org/prop-types-extra/-/prop-types-extra-1.1.1.tgz
		-> npm-prop-types-extra-1.1.1.tgz.npm
	https://registry.npmjs.org/prop-types/-/prop-types-15.8.1.tgz
		-> npm-prop-types-15.8.1.tgz.npm
	https://registry.npmjs.org/punycode/-/punycode-2.3.1.tgz
		-> npm-punycode-2.3.1.tgz.npm
	https://registry.npmjs.org/queue-microtask/-/queue-microtask-1.2.3.tgz
		-> npm-queue-microtask-1.2.3.tgz.npm
	https://registry.npmjs.org/react-arborist/-/react-arborist-3.4.0.tgz
		-> npm-react-arborist-3.4.0.tgz.npm
	https://registry.npmjs.org/react-bootstrap/-/react-bootstrap-2.10.5.tgz
		-> npm-react-bootstrap-2.10.5.tgz.npm
	https://registry.npmjs.org/react-dnd-html5-backend/-/react-dnd-html5-backend-14.1.0.tgz
		-> npm-react-dnd-html5-backend-14.1.0.tgz.npm
	https://registry.npmjs.org/react-dnd/-/react-dnd-14.0.5.tgz
		-> npm-react-dnd-14.0.5.tgz.npm
	https://registry.npmjs.org/react-dom/-/react-dom-18.3.1.tgz
		-> npm-react-dom-18.3.1.tgz.npm
	https://registry.npmjs.org/react-dropzone/-/react-dropzone-14.3.5.tgz
		-> npm-react-dropzone-14.3.5.tgz.npm
	https://registry.npmjs.org/react-icons/-/react-icons-5.3.0.tgz
		-> npm-react-icons-5.3.0.tgz.npm
	https://registry.npmjs.org/react-is/-/react-is-16.13.1.tgz
		-> npm-react-is-16.13.1.tgz.npm
	https://registry.npmjs.org/react-lifecycles-compat/-/react-lifecycles-compat-3.0.4.tgz
		-> npm-react-lifecycles-compat-3.0.4.tgz.npm
	https://registry.npmjs.org/react-pdf/-/react-pdf-9.1.1.tgz
		-> npm-react-pdf-9.1.1.tgz.npm
	https://registry.npmjs.org/react-router-dom/-/react-router-dom-5.3.4.tgz
		-> npm-react-router-dom-5.3.4.tgz.npm
	https://registry.npmjs.org/react-router/-/react-router-5.3.4.tgz
		-> npm-react-router-5.3.4.tgz.npm
	https://registry.npmjs.org/react-toastify/-/react-toastify-10.0.6.tgz
		-> npm-react-toastify-10.0.6.tgz.npm
	https://registry.npmjs.org/react-transition-group/-/react-transition-group-4.4.5.tgz
		-> npm-react-transition-group-4.4.5.tgz.npm
	https://registry.npmjs.org/react-window/-/react-window-1.8.10.tgz
		-> npm-react-window-1.8.10.tgz.npm
	https://registry.npmjs.org/react/-/react-18.3.1.tgz
		-> npm-react-18.3.1.tgz.npm
	https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.2.tgz
		-> npm-readable-stream-3.6.2.tgz.npm
	https://registry.npmjs.org/readable-stream/-/readable-stream-4.7.0.tgz
		-> npm-readable-stream-4.7.0.tgz.npm
	https://registry.npmjs.org/readdirp/-/readdirp-3.6.0.tgz
		-> npm-readdirp-3.6.0.tgz.npm
	https://registry.npmjs.org/redux/-/redux-4.2.1.tgz
		-> npm-redux-4.2.1.tgz.npm
	https://registry.npmjs.org/redux/-/redux-5.0.1.tgz
		-> npm-redux-5.0.1.tgz.npm
	https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.14.1.tgz
		-> npm-regenerator-runtime-0.14.1.tgz.npm
	https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz
		-> npm-resolve-from-4.0.0.tgz.npm
	https://registry.npmjs.org/resolve-pathname/-/resolve-pathname-3.0.0.tgz
		-> npm-resolve-pathname-3.0.0.tgz.npm
	https://registry.npmjs.org/reusify/-/reusify-1.0.4.tgz
		-> npm-reusify-1.0.4.tgz.npm
	https://registry.npmjs.org/rfdc/-/rfdc-1.4.1.tgz
		-> npm-rfdc-1.4.1.tgz.npm
	https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz
		-> npm-rimraf-3.0.2.tgz.npm
	https://registry.npmjs.org/rollup/-/rollup-4.44.1.tgz
		-> npm-rollup-4.44.1.tgz.npm
	https://registry.npmjs.org/run-parallel/-/run-parallel-1.2.0.tgz
		-> npm-run-parallel-1.2.0.tgz.npm
	https://registry.npmjs.org/rxjs/-/rxjs-7.8.1.tgz
		-> npm-rxjs-7.8.1.tgz.npm
	https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz
		-> npm-safe-buffer-5.2.1.tgz.npm
	https://registry.npmjs.org/sass-embedded/-/sass-embedded-1.81.0.tgz
		-> npm-sass-embedded-1.81.0.tgz.npm
	https://registry.npmjs.org/sass/-/sass-1.77.6.tgz
		-> npm-sass-1.77.6.tgz.npm
	https://registry.npmjs.org/scheduler/-/scheduler-0.23.2.tgz
		-> npm-scheduler-0.23.2.tgz.npm
	https://registry.npmjs.org/semver/-/semver-6.3.1.tgz
		-> npm-semver-6.3.1.tgz.npm
	https://registry.npmjs.org/semver/-/semver-7.6.3.tgz
		-> npm-semver-7.6.3.tgz.npm
	https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz
		-> npm-set-blocking-2.0.0.tgz.npm
	https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz
		-> npm-shebang-command-2.0.0.tgz.npm
	https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz
		-> npm-shebang-regex-3.0.0.tgz.npm
	https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz
		-> npm-signal-exit-3.0.7.tgz.npm
	https://registry.npmjs.org/simple-concat/-/simple-concat-1.0.1.tgz
		-> npm-simple-concat-1.0.1.tgz.npm
	https://registry.npmjs.org/simple-get/-/simple-get-3.1.1.tgz
		-> npm-simple-get-3.1.1.tgz.npm
	https://registry.npmjs.org/smart-buffer/-/smart-buffer-4.2.0.tgz
		-> npm-smart-buffer-4.2.0.tgz.npm
	https://registry.npmjs.org/socks/-/socks-2.8.7.tgz
		-> npm-socks-2.8.7.tgz.npm
	https://registry.npmjs.org/source-map-js/-/source-map-js-1.2.1.tgz
		-> npm-source-map-js-1.2.1.tgz.npm
	https://registry.npmjs.org/split2/-/split2-4.2.0.tgz
		-> npm-split2-4.2.0.tgz.npm
	https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz
		-> npm-string-width-4.2.3.tgz.npm
	https://registry.npmjs.org/string_decoder/-/string_decoder-1.3.0.tgz
		-> npm-string_decoder-1.3.0.tgz.npm
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz
		-> npm-strip-ansi-6.0.1.tgz.npm
	https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-3.1.1.tgz
		-> npm-strip-json-comments-3.1.1.tgz.npm
	https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz
		-> npm-supports-color-7.2.0.tgz.npm
	https://registry.npmjs.org/supports-color/-/supports-color-8.1.1.tgz
		-> npm-supports-color-8.1.1.tgz.npm
	https://registry.npmjs.org/sync-child-process/-/sync-child-process-1.0.2.tgz
		-> npm-sync-child-process-1.0.2.tgz.npm
	https://registry.npmjs.org/sync-message-port/-/sync-message-port-1.1.3.tgz
		-> npm-sync-message-port-1.1.3.tgz.npm
	https://registry.npmjs.org/tar/-/tar-6.2.1.tgz
		-> npm-tar-6.2.1.tgz.npm
	https://registry.npmjs.org/tiny-invariant/-/tiny-invariant-1.3.3.tgz
		-> npm-tiny-invariant-1.3.3.tgz.npm
	https://registry.npmjs.org/tiny-warning/-/tiny-warning-1.0.3.tgz
		-> npm-tiny-warning-1.0.3.tgz.npm
	https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz
		-> npm-to-regex-range-5.0.1.tgz.npm
	https://registry.npmjs.org/tr46/-/tr46-0.0.3.tgz
		-> npm-tr46-0.0.3.tgz.npm
	https://registry.npmjs.org/ts-api-utils/-/ts-api-utils-1.4.0.tgz
		-> npm-ts-api-utils-1.4.0.tgz.npm
	https://registry.npmjs.org/tslib/-/tslib-2.8.1.tgz
		-> npm-tslib-2.8.1.tgz.npm
	https://registry.npmjs.org/type-check/-/type-check-0.4.0.tgz
		-> npm-type-check-0.4.0.tgz.npm
	https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz
		-> npm-typedarray-0.0.6.tgz.npm
	https://registry.npmjs.org/typescript-eslint/-/typescript-eslint-8.15.0.tgz
		-> npm-typescript-eslint-8.15.0.tgz.npm
	https://registry.npmjs.org/typescript/-/typescript-5.6.3.tgz
		-> npm-typescript-5.6.3.tgz.npm
	https://registry.npmjs.org/uncontrollable/-/uncontrollable-7.2.1.tgz
		-> npm-uncontrollable-7.2.1.tgz.npm
	https://registry.npmjs.org/uncontrollable/-/uncontrollable-8.0.4.tgz
		-> npm-uncontrollable-8.0.4.tgz.npm
	https://registry.npmjs.org/undici-types/-/undici-types-7.18.2.tgz
		-> npm-undici-types-7.18.2.tgz.npm
	https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz
		-> npm-uri-js-4.4.1.tgz.npm
	https://registry.npmjs.org/use-sync-external-store/-/use-sync-external-store-1.2.2.tgz
		-> npm-use-sync-external-store-1.2.2.tgz.npm
	https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz
		-> npm-util-deprecate-1.0.2.tgz.npm
	https://registry.npmjs.org/value-equal/-/value-equal-1.0.1.tgz
		-> npm-value-equal-1.0.1.tgz.npm
	https://registry.npmjs.org/varint/-/varint-6.0.0.tgz
		-> npm-varint-6.0.0.tgz.npm
	https://registry.npmjs.org/vite/-/vite-5.4.19.tgz
		-> npm-vite-5.4.19.tgz.npm
	https://registry.npmjs.org/warning/-/warning-4.0.3.tgz
		-> npm-warning-4.0.3.tgz.npm
	https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-3.0.1.tgz
		-> npm-webidl-conversions-3.0.1.tgz.npm
	https://registry.npmjs.org/whatwg-url/-/whatwg-url-5.0.0.tgz
		-> npm-whatwg-url-5.0.0.tgz.npm
	https://registry.npmjs.org/which/-/which-2.0.2.tgz
		-> npm-which-2.0.2.tgz.npm
	https://registry.npmjs.org/wide-align/-/wide-align-1.1.5.tgz
		-> npm-wide-align-1.1.5.tgz.npm
	https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.5.tgz
		-> npm-word-wrap-1.2.5.tgz.npm
	https://registry.npmjs.org/worker-factory/-/worker-factory-7.0.49.tgz
		-> npm-worker-factory-7.0.49.tgz.npm
	https://registry.npmjs.org/worker-timers-broker/-/worker-timers-broker-8.0.16.tgz
		-> npm-worker-timers-broker-8.0.16.tgz.npm
	https://registry.npmjs.org/worker-timers-worker/-/worker-timers-worker-9.0.14.tgz
		-> npm-worker-timers-worker-9.0.14.tgz.npm
	https://registry.npmjs.org/worker-timers/-/worker-timers-8.0.31.tgz
		-> npm-worker-timers-8.0.31.tgz.npm
	https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz
		-> npm-wrappy-1.0.2.tgz.npm
	https://registry.npmjs.org/ws/-/ws-8.20.0.tgz
		-> npm-ws-8.20.0.tgz.npm
	https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz
		-> npm-yallist-4.0.0.tgz.npm
	https://registry.npmjs.org/yocto-queue/-/yocto-queue-0.1.0.tgz
		-> npm-yocto-queue-0.1.0.tgz.npm
	amd64? (
		https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.21.5.tgz
			-> npm-@esbuild+linux-x64-0.21.5.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-x64-gnu/-/rollup-linux-x64-gnu-4.44.1.tgz
			-> npm-@rollup+rollup-linux-x64-gnu-4.44.1.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-x64-musl/-/rollup-linux-x64-musl-4.44.1.tgz
			-> npm-@rollup+rollup-linux-x64-musl-4.44.1.tgz.npm
		https://registry.npmjs.org/@swc/core-linux-x64-gnu/-/core-linux-x64-gnu-1.9.2.tgz
			-> npm-@swc+core-linux-x64-gnu-1.9.2.tgz.npm
		https://registry.npmjs.org/@swc/core-linux-x64-musl/-/core-linux-x64-musl-1.9.2.tgz
			-> npm-@swc+core-linux-x64-musl-1.9.2.tgz.npm
		https://registry.npmjs.org/sass-embedded-linux-musl-x64/-/sass-embedded-linux-musl-x64-1.81.0.tgz
			-> npm-sass-embedded-linux-musl-x64-1.81.0.tgz.npm
		https://registry.npmjs.org/sass-embedded-linux-x64/-/sass-embedded-linux-x64-1.81.0.tgz
			-> npm-sass-embedded-linux-x64-1.81.0.tgz.npm
	)
	arm64? (
		https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.21.5.tgz
			-> npm-@esbuild+linux-arm64-0.21.5.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-arm64-gnu/-/rollup-linux-arm64-gnu-4.44.1.tgz
			-> npm-@rollup+rollup-linux-arm64-gnu-4.44.1.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-arm64-musl/-/rollup-linux-arm64-musl-4.44.1.tgz
			-> npm-@rollup+rollup-linux-arm64-musl-4.44.1.tgz.npm
		https://registry.npmjs.org/@swc/core-linux-arm64-gnu/-/core-linux-arm64-gnu-1.9.2.tgz
			-> npm-@swc+core-linux-arm64-gnu-1.9.2.tgz.npm
		https://registry.npmjs.org/@swc/core-linux-arm64-musl/-/core-linux-arm64-musl-1.9.2.tgz
			-> npm-@swc+core-linux-arm64-musl-1.9.2.tgz.npm
		https://registry.npmjs.org/sass-embedded-linux-arm64/-/sass-embedded-linux-arm64-1.81.0.tgz
			-> npm-sass-embedded-linux-arm64-1.81.0.tgz.npm
		https://registry.npmjs.org/sass-embedded-linux-musl-arm64/-/sass-embedded-linux-musl-arm64-1.81.0.tgz
			-> npm-sass-embedded-linux-musl-arm64-1.81.0.tgz.npm
	)
"

# Go modules come straight from proxy.golang.org; the eclass's
# mirror://goproxy// URIs break on goproxy.io (see net-misc/rmapi).
SRC_URI="
	https://github.com/ddvk/rmfakecloud/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI//mirror:\/\/goproxy\/\//https://proxy.golang.org/}
	${NPM_SRC_URI}
"

LICENSE="AGPL-3"
# Go modules and bundled web UI libraries
LICENSE+=" Apache-2.0 BSD BSD-2 ISC MIT"
SLOT="0"
# Limited to the arches sys-apps/pnpm-bin (::guru) has; on arm, use
# net-misc/rmfakecloud-bin
KEYWORDS="~amd64 ~arm64"

DEPEND="
	acct-group/rmfakecloud
	acct-user/rmfakecloud
"
RDEPEND="
	${DEPEND}
	!net-misc/rmfakecloud-bin
"
BDEPEND="
	>=dev-lang/go-1.23.3:=
	net-libs/nodejs
	>=sys-apps/pnpm-bin-12
"

src_prepare() {
	default

	# Lay the NPM_SRC_URI distfiles out like the registry serves them
	# (<name>/-/<basename>-<version>.tgz) so pnpm can use the directory as a
	# file:// registry. The lockfile stays as upstream ships it: pnpm 12
	# rejects registry packages whose resolution points anywhere else.
	# Packages for other arches and libcs have no distfile and are left out;
	# pnpm skips them anyway.
	local key name version file
	while read -r key; do
		name=${key%@*}
		version=${key##*@}
		file=npm-${name/\//+}-${version}.tgz.npm
		[[ -e ${DISTDIR}/${file} ]] || continue
		mkdir -p "${T}/registry/${name}/-" || die
		ln -s "${DISTDIR}/${file}" \
			"${T}/registry/${name}/-/${name##*/}-${version}.tgz" || die
	done < <(awk '
		/^packages:/ { p = 1; next }
		/^snapshots:/ { p = 0 }
		p && /^  [^ ]/ { gsub(/^  \047?|\047?:$/, ""); print }
	' ui/pnpm-lock.yaml || die)
}

src_compile() {
	# Go would otherwise try to download the toolchain named in go.mod
	export GOTOOLCHAIN=local

	# --trust-lockfile skips pnpm's supply-chain policy check, which needs
	# registry metadata; every tarball is pinned by the Manifest and by its
	# integrity in the lockfile. Install scripts are skipped: the native
	# tools (esbuild, rollup, swc, sass) ship as per-platform npm packages
	# and need no postinstall step.
	pnpm install --dir ui \
		--registry "file://${T}/registry/" \
		--store-dir "${T}"/pnpm-store \
		--config.update-notifier=false \
		--frozen-lockfile --trust-lockfile --ignore-scripts || die
	# tsc + vite build into ui/dist, which ui/assets.go embeds
	pnpm --dir ui run build || die

	ego build -ldflags "-X main.version=v${PV}" -o rmfakecloud ./cmd/rmfakecloud
}

src_test() {
	ego test ./...
}

src_install() {
	dobin rmfakecloud
	dodoc CHANGELOG.md README.md

	insinto /etc
	newins "${FILESDIR}"/rmfakecloud.conf rmfakecloud.conf
	# Holds JWT_SECRET_KEY and possibly SMTP credentials
	fperms 0640 /etc/rmfakecloud.conf
	fowners root:rmfakecloud /etc/rmfakecloud.conf

	newinitd "${FILESDIR}"/rmfakecloud.initd rmfakecloud
	systemd_dounit "${FILESDIR}"/rmfakecloud.service

	keepdir /var/lib/rmfakecloud /var/log/rmfakecloud
	fowners rmfakecloud:rmfakecloud /var/lib/rmfakecloud /var/log/rmfakecloud
	fperms 0750 /var/lib/rmfakecloud
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog "Set JWT_SECRET_KEY and STORAGE_URL in /etc/rmfakecloud.conf, then"
		elog "create an admin user (run as rmfakecloud with DATADIR set):"
		elog "  rmfakecloud setuser -u <name> -a"
		elog "The tablet itself needs rmfakecloud-proxy (e.g. from toltec) to"
		elog "redirect its cloud traffic here; see"
		elog "  https://ddvk.github.io/rmfakecloud/remarkable/setup/"
	fi
}
