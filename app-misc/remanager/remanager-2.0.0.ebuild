# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop go-module optfeature xdg

# go.mod replaces wails/v3 with ./third_party/wails-v3, which upstream fills
# from the module cache (scripts/prepare-wails-fork.sh). Keep this in sync
# with the wailsapp/wails/v3 version in go.mod.
WAILS_PV="3.0.0-beta.26"
APP_ID="io.scottlabs.reManager"

DESCRIPTION="Desktop app for managing mods on reMarkable tablets via Vellum"
HOMEPAGE="https://github.com/rmitchellscott/reManager"

# Generated with: scripts/ego-sum.sh go.sum
EGO_SUM=(
	"al.essio.dev/pkg/shellescape v1.6.0"
	"al.essio.dev/pkg/shellescape v1.6.0/go.mod"
	"github.com/Microsoft/go-winio v0.6.2"
	"github.com/Microsoft/go-winio v0.6.2/go.mod"
	"github.com/adrg/xdg v0.5.3"
	"github.com/adrg/xdg v0.5.3/go.mod"
	"github.com/clipperhouse/uax29/v2 v2.7.0"
	"github.com/clipperhouse/uax29/v2 v2.7.0/go.mod"
	"github.com/coder/websocket v1.8.14"
	"github.com/coder/websocket v1.8.14/go.mod"
	"github.com/danieljoos/wincred v1.2.3"
	"github.com/danieljoos/wincred v1.2.3/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc"
	"github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc/go.mod"
	"github.com/go-json-experiment/json v0.0.0-20251027170946-4849db3c2f7e"
	"github.com/go-json-experiment/json v0.0.0-20251027170946-4849db3c2f7e/go.mod"
	"github.com/go-ole/go-ole v1.3.0"
	"github.com/go-ole/go-ole v1.3.0/go.mod"
	"github.com/godbus/dbus/v5 v5.2.2"
	"github.com/godbus/dbus/v5 v5.2.2/go.mod"
	"github.com/google/btree v1.1.2"
	"github.com/google/btree v1.1.2/go.mod"
	"github.com/google/go-cmp v0.7.0"
	"github.com/google/go-cmp v0.7.0/go.mod"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510/go.mod"
	"github.com/google/uuid v1.6.0"
	"github.com/google/uuid v1.6.0/go.mod"
	"github.com/hhrutter/tiff v1.0.6"
	"github.com/hhrutter/tiff v1.0.6/go.mod"
	"github.com/klauspost/compress v1.18.7"
	"github.com/klauspost/compress v1.18.7/go.mod"
	"github.com/kr/fs v0.1.0"
	"github.com/kr/fs v0.1.0/go.mod"
	"github.com/matryer/is v1.4.1"
	"github.com/matryer/is v1.4.1/go.mod"
	"github.com/mattn/go-colorable v0.1.14"
	"github.com/mattn/go-colorable v0.1.14/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/mattn/go-runewidth v0.0.27"
	"github.com/mattn/go-runewidth v0.0.27/go.mod"
	"github.com/pdfcpu/pdfcpu v0.15.0"
	"github.com/pdfcpu/pdfcpu v0.15.0/go.mod"
	"github.com/pkg/sftp v1.13.10"
	"github.com/pkg/sftp v1.13.10/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rmitchellscott/remarkable-go v0.4.1"
	"github.com/rmitchellscott/remarkable-go v0.4.1/go.mod"
	"github.com/rymdport/portal v0.4.3-0.20260225172009-01112360d2cb"
	"github.com/rymdport/portal v0.4.3-0.20260225172009-01112360d2cb/go.mod"
	"github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966"
	"github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/objx v0.5.2"
	"github.com/stretchr/objx v0.5.2/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.4/go.mod"
	"github.com/stretchr/testify v1.11.1"
	"github.com/stretchr/testify v1.11.1/go.mod"
	"github.com/zalando/go-keyring v0.2.6"
	"github.com/zalando/go-keyring v0.2.6/go.mod"
	"go.yaml.in/yaml/v3 v3.0.5"
	"go.yaml.in/yaml/v3 v3.0.5/go.mod"
	"golang.org/x/crypto v0.56.0"
	"golang.org/x/crypto v0.56.0/go.mod"
	"golang.org/x/exp v0.0.0-20260410095643-746e56fc9e2f"
	"golang.org/x/exp v0.0.0-20260410095643-746e56fc9e2f/go.mod"
	"golang.org/x/image v0.45.0"
	"golang.org/x/image v0.45.0/go.mod"
	"golang.org/x/sys v0.1.0/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.47.0"
	"golang.org/x/sys v0.47.0/go.mod"
	"golang.org/x/term v0.45.0"
	"golang.org/x/term v0.45.0/go.mod"
	"golang.org/x/text v0.41.0"
	"golang.org/x/text v0.41.0/go.mod"
	"golang.org/x/time v0.15.0"
	"golang.org/x/time v0.15.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/ini.v1 v1.67.1"
	"gopkg.in/ini.v1 v1.67.1/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"gvisor.dev/gvisor v0.0.0-20261006185811-fdfbe30a6785"
	"gvisor.dev/gvisor v0.0.0-20261006185811-fdfbe30a6785/go.mod"
)
go-module_set_globals

# Frontend dependencies, one distfile per npm tarball.
# Generated with: scripts/npm-src-uri.py frontend/package-lock.json
NPM_SRC_URI="
	https://registry.npmjs.org/@alloc/quick-lru/-/quick-lru-5.2.0.tgz
		-> npm-@alloc+quick-lru-5.2.0.tgz.npm
	https://registry.npmjs.org/@ampproject/remapping/-/remapping-2.3.0.tgz
		-> npm-@ampproject+remapping-2.3.0.tgz.npm
	https://registry.npmjs.org/@asamuzakjp/css-color/-/css-color-5.1.11.tgz
		-> npm-@asamuzakjp+css-color-5.1.11.tgz.npm
	https://registry.npmjs.org/@asamuzakjp/dom-selector/-/dom-selector-7.1.1.tgz
		-> npm-@asamuzakjp+dom-selector-7.1.1.tgz.npm
	https://registry.npmjs.org/@asamuzakjp/generational-cache/-/generational-cache-1.0.1.tgz
		-> npm-@asamuzakjp+generational-cache-1.0.1.tgz.npm
	https://registry.npmjs.org/@asamuzakjp/nwsapi/-/nwsapi-2.3.9.tgz
		-> npm-@asamuzakjp+nwsapi-2.3.9.tgz.npm
	https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.27.1.tgz
		-> npm-@babel+code-frame-7.27.1.tgz.npm
	https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.28.5.tgz
		-> npm-@babel+compat-data-7.28.5.tgz.npm
	https://registry.npmjs.org/@babel/core/-/core-7.28.5.tgz
		-> npm-@babel+core-7.28.5.tgz.npm
	https://registry.npmjs.org/@babel/generator/-/generator-7.28.5.tgz
		-> npm-@babel+generator-7.28.5.tgz.npm
	https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.27.2.tgz
		-> npm-@babel+helper-compilation-targets-7.27.2.tgz.npm
	https://registry.npmjs.org/@babel/helper-globals/-/helper-globals-7.28.0.tgz
		-> npm-@babel+helper-globals-7.28.0.tgz.npm
	https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.27.1.tgz
		-> npm-@babel+helper-module-imports-7.27.1.tgz.npm
	https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.28.3.tgz
		-> npm-@babel+helper-module-transforms-7.28.3.tgz.npm
	https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.27.1.tgz
		-> npm-@babel+helper-plugin-utils-7.27.1.tgz.npm
	https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.27.1.tgz
		-> npm-@babel+helper-string-parser-7.27.1.tgz.npm
	https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.28.5.tgz
		-> npm-@babel+helper-validator-identifier-7.28.5.tgz.npm
	https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.27.1.tgz
		-> npm-@babel+helper-validator-option-7.27.1.tgz.npm
	https://registry.npmjs.org/@babel/helpers/-/helpers-7.28.4.tgz
		-> npm-@babel+helpers-7.28.4.tgz.npm
	https://registry.npmjs.org/@babel/parser/-/parser-7.28.5.tgz
		-> npm-@babel+parser-7.28.5.tgz.npm
	https://registry.npmjs.org/@babel/plugin-transform-react-jsx-self/-/plugin-transform-react-jsx-self-7.27.1.tgz
		-> npm-@babel+plugin-transform-react-jsx-self-7.27.1.tgz.npm
	https://registry.npmjs.org/@babel/plugin-transform-react-jsx-source/-/plugin-transform-react-jsx-source-7.27.1.tgz
		-> npm-@babel+plugin-transform-react-jsx-source-7.27.1.tgz.npm
	https://registry.npmjs.org/@babel/runtime/-/runtime-7.29.7.tgz
		-> npm-@babel+runtime-7.29.7.tgz.npm
	https://registry.npmjs.org/@babel/template/-/template-7.27.2.tgz
		-> npm-@babel+template-7.27.2.tgz.npm
	https://registry.npmjs.org/@babel/traverse/-/traverse-7.28.5.tgz
		-> npm-@babel+traverse-7.28.5.tgz.npm
	https://registry.npmjs.org/@babel/types/-/types-7.28.5.tgz
		-> npm-@babel+types-7.28.5.tgz.npm
	https://registry.npmjs.org/@bcoe/v8-coverage/-/v8-coverage-1.0.2.tgz
		-> npm-@bcoe+v8-coverage-1.0.2.tgz.npm
	https://registry.npmjs.org/@bramus/specificity/-/specificity-2.4.2.tgz
		-> npm-@bramus+specificity-2.4.2.tgz.npm
	https://registry.npmjs.org/@cacheable/memory/-/memory-2.2.0.tgz
		-> npm-@cacheable+memory-2.2.0.tgz.npm
	https://registry.npmjs.org/@cacheable/utils/-/utils-2.5.0.tgz
		-> npm-@cacheable+utils-2.5.0.tgz.npm
	https://registry.npmjs.org/@csstools/color-helpers/-/color-helpers-6.1.2.tgz
		-> npm-@csstools+color-helpers-6.1.2.tgz.npm
	https://registry.npmjs.org/@csstools/css-calc/-/css-calc-3.4.1.tgz
		-> npm-@csstools+css-calc-3.4.1.tgz.npm
	https://registry.npmjs.org/@csstools/css-color-parser/-/css-color-parser-4.2.4.tgz
		-> npm-@csstools+css-color-parser-4.2.4.tgz.npm
	https://registry.npmjs.org/@csstools/css-parser-algorithms/-/css-parser-algorithms-4.0.1.tgz
		-> npm-@csstools+css-parser-algorithms-4.0.1.tgz.npm
	https://registry.npmjs.org/@csstools/css-syntax-patches-for-csstree/-/css-syntax-patches-for-csstree-1.1.14.tgz
		-> npm-@csstools+css-syntax-patches-for-csstree-1.1.14.tgz.npm
	https://registry.npmjs.org/@csstools/css-tokenizer/-/css-tokenizer-4.0.2.tgz
		-> npm-@csstools+css-tokenizer-4.0.2.tgz.npm
	https://registry.npmjs.org/@eslint-community/eslint-utils/-/eslint-utils-4.10.1.tgz
		-> npm-@eslint-community+eslint-utils-4.10.1.tgz.npm
	https://registry.npmjs.org/@eslint-community/regexpp/-/regexpp-4.12.2.tgz
		-> npm-@eslint-community+regexpp-4.12.2.tgz.npm
	https://registry.npmjs.org/@eslint/config-array/-/config-array-0.23.5.tgz
		-> npm-@eslint+config-array-0.23.5.tgz.npm
	https://registry.npmjs.org/@eslint/config-helpers/-/config-helpers-0.7.0.tgz
		-> npm-@eslint+config-helpers-0.7.0.tgz.npm
	https://registry.npmjs.org/@eslint/core/-/core-1.2.1.tgz
		-> npm-@eslint+core-1.2.1.tgz.npm
	https://registry.npmjs.org/@eslint/js/-/js-10.0.1.tgz
		-> npm-@eslint+js-10.0.1.tgz.npm
	https://registry.npmjs.org/@eslint/object-schema/-/object-schema-3.0.5.tgz
		-> npm-@eslint+object-schema-3.0.5.tgz.npm
	https://registry.npmjs.org/@eslint/plugin-kit/-/plugin-kit-0.7.3.tgz
		-> npm-@eslint+plugin-kit-0.7.3.tgz.npm
	https://registry.npmjs.org/@exodus/bytes/-/bytes-1.16.0.tgz
		-> npm-@exodus+bytes-1.16.0.tgz.npm
	https://registry.npmjs.org/@floating-ui/core/-/core-1.7.3.tgz
		-> npm-@floating-ui+core-1.7.3.tgz.npm
	https://registry.npmjs.org/@floating-ui/dom/-/dom-1.7.4.tgz
		-> npm-@floating-ui+dom-1.7.4.tgz.npm
	https://registry.npmjs.org/@floating-ui/react-dom/-/react-dom-2.1.6.tgz
		-> npm-@floating-ui+react-dom-2.1.6.tgz.npm
	https://registry.npmjs.org/@floating-ui/utils/-/utils-0.2.10.tgz
		-> npm-@floating-ui+utils-0.2.10.tgz.npm
	https://registry.npmjs.org/@humanfs/core/-/core-0.19.2.tgz
		-> npm-@humanfs+core-0.19.2.tgz.npm
	https://registry.npmjs.org/@humanfs/node/-/node-0.16.8.tgz
		-> npm-@humanfs+node-0.16.8.tgz.npm
	https://registry.npmjs.org/@humanfs/types/-/types-0.15.0.tgz
		-> npm-@humanfs+types-0.15.0.tgz.npm
	https://registry.npmjs.org/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz
		-> npm-@humanwhocodes+module-importer-1.0.1.tgz.npm
	https://registry.npmjs.org/@humanwhocodes/retry/-/retry-0.4.3.tgz
		-> npm-@humanwhocodes+retry-0.4.3.tgz.npm
	https://registry.npmjs.org/@isaacs/cliui/-/cliui-8.0.2.tgz
		-> npm-@isaacs+cliui-8.0.2.tgz.npm
	https://registry.npmjs.org/@istanbuljs/schema/-/schema-0.1.6.tgz
		-> npm-@istanbuljs+schema-0.1.6.tgz.npm
	https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.13.tgz
		-> npm-@jridgewell+gen-mapping-0.3.13.tgz.npm
	https://registry.npmjs.org/@jridgewell/remapping/-/remapping-2.3.5.tgz
		-> npm-@jridgewell+remapping-2.3.5.tgz.npm
	https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz
		-> npm-@jridgewell+resolve-uri-3.1.2.tgz.npm
	https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.5.tgz
		-> npm-@jridgewell+sourcemap-codec-1.5.5.tgz.npm
	https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.31.tgz
		-> npm-@jridgewell+trace-mapping-0.3.31.tgz.npm
	https://registry.npmjs.org/@keyv/bigmap/-/bigmap-1.3.1.tgz
		-> npm-@keyv+bigmap-1.3.1.tgz.npm
	https://registry.npmjs.org/@keyv/serialize/-/serialize-1.1.1.tgz
		-> npm-@keyv+serialize-1.1.1.tgz.npm
	https://registry.npmjs.org/@monaco-editor/loader/-/loader-1.7.0.tgz
		-> npm-@monaco-editor+loader-1.7.0.tgz.npm
	https://registry.npmjs.org/@monaco-editor/react/-/react-4.7.0.tgz
		-> npm-@monaco-editor+react-4.7.0.tgz.npm
	https://registry.npmjs.org/@phosphor-icons/react/-/react-2.1.10.tgz
		-> npm-@phosphor-icons+react-2.1.10.tgz.npm
	https://registry.npmjs.org/@pkgjs/parseargs/-/parseargs-0.11.0.tgz
		-> npm-@pkgjs+parseargs-0.11.0.tgz.npm
	https://registry.npmjs.org/@radix-ui/number/-/number-1.1.1.tgz
		-> npm-@radix-ui+number-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/primitive/-/primitive-1.1.3.tgz
		-> npm-@radix-ui+primitive-1.1.3.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-accordion/-/react-accordion-1.2.12.tgz
		-> npm-@radix-ui+react-accordion-1.2.12.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-arrow/-/react-arrow-1.1.7.tgz
		-> npm-@radix-ui+react-arrow-1.1.7.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-checkbox/-/react-checkbox-1.3.3.tgz
		-> npm-@radix-ui+react-checkbox-1.3.3.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-collapsible/-/react-collapsible-1.1.12.tgz
		-> npm-@radix-ui+react-collapsible-1.1.12.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-collection/-/react-collection-1.1.7.tgz
		-> npm-@radix-ui+react-collection-1.1.7.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-compose-refs/-/react-compose-refs-1.1.2.tgz
		-> npm-@radix-ui+react-compose-refs-1.1.2.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-context-menu/-/react-context-menu-2.2.16.tgz
		-> npm-@radix-ui+react-context-menu-2.2.16.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-context/-/react-context-1.1.2.tgz
		-> npm-@radix-ui+react-context-1.1.2.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-dialog/-/react-dialog-1.1.15.tgz
		-> npm-@radix-ui+react-dialog-1.1.15.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-direction/-/react-direction-1.1.1.tgz
		-> npm-@radix-ui+react-direction-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-dismissable-layer/-/react-dismissable-layer-1.1.11.tgz
		-> npm-@radix-ui+react-dismissable-layer-1.1.11.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-dropdown-menu/-/react-dropdown-menu-2.1.16.tgz
		-> npm-@radix-ui+react-dropdown-menu-2.1.16.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-focus-guards/-/react-focus-guards-1.1.3.tgz
		-> npm-@radix-ui+react-focus-guards-1.1.3.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-focus-scope/-/react-focus-scope-1.1.7.tgz
		-> npm-@radix-ui+react-focus-scope-1.1.7.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-id/-/react-id-1.1.1.tgz
		-> npm-@radix-ui+react-id-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-menu/-/react-menu-2.1.16.tgz
		-> npm-@radix-ui+react-menu-2.1.16.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-popover/-/react-popover-1.1.15.tgz
		-> npm-@radix-ui+react-popover-1.1.15.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-popper/-/react-popper-1.2.8.tgz
		-> npm-@radix-ui+react-popper-1.2.8.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-portal/-/react-portal-1.1.9.tgz
		-> npm-@radix-ui+react-portal-1.1.9.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-presence/-/react-presence-1.1.5.tgz
		-> npm-@radix-ui+react-presence-1.1.5.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-primitive/-/react-primitive-2.1.3.tgz
		-> npm-@radix-ui+react-primitive-2.1.3.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-radio-group/-/react-radio-group-1.3.8.tgz
		-> npm-@radix-ui+react-radio-group-1.3.8.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-roving-focus/-/react-roving-focus-1.1.11.tgz
		-> npm-@radix-ui+react-roving-focus-1.1.11.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-select/-/react-select-2.2.6.tgz
		-> npm-@radix-ui+react-select-2.2.6.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-slot/-/react-slot-1.2.3.tgz
		-> npm-@radix-ui+react-slot-1.2.3.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-slot/-/react-slot-1.2.4.tgz
		-> npm-@radix-ui+react-slot-1.2.4.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-tabs/-/react-tabs-1.1.13.tgz
		-> npm-@radix-ui+react-tabs-1.1.13.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-tooltip/-/react-tooltip-1.2.8.tgz
		-> npm-@radix-ui+react-tooltip-1.2.8.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-callback-ref/-/react-use-callback-ref-1.1.1.tgz
		-> npm-@radix-ui+react-use-callback-ref-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-controllable-state/-/react-use-controllable-state-1.2.2.tgz
		-> npm-@radix-ui+react-use-controllable-state-1.2.2.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-effect-event/-/react-use-effect-event-0.0.2.tgz
		-> npm-@radix-ui+react-use-effect-event-0.0.2.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-escape-keydown/-/react-use-escape-keydown-1.1.1.tgz
		-> npm-@radix-ui+react-use-escape-keydown-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-layout-effect/-/react-use-layout-effect-1.1.1.tgz
		-> npm-@radix-ui+react-use-layout-effect-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-previous/-/react-use-previous-1.1.1.tgz
		-> npm-@radix-ui+react-use-previous-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-rect/-/react-use-rect-1.1.1.tgz
		-> npm-@radix-ui+react-use-rect-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-use-size/-/react-use-size-1.1.1.tgz
		-> npm-@radix-ui+react-use-size-1.1.1.tgz.npm
	https://registry.npmjs.org/@radix-ui/react-visually-hidden/-/react-visually-hidden-1.2.3.tgz
		-> npm-@radix-ui+react-visually-hidden-1.2.3.tgz.npm
	https://registry.npmjs.org/@radix-ui/rect/-/rect-1.1.1.tgz
		-> npm-@radix-ui+rect-1.1.1.tgz.npm
	https://registry.npmjs.org/@rolldown/pluginutils/-/pluginutils-1.0.0-beta.27.tgz
		-> npm-@rolldown+pluginutils-1.0.0-beta.27.tgz.npm
	https://registry.npmjs.org/@tailwindcss/node/-/node-4.1.18.tgz
		-> npm-@tailwindcss+node-4.1.18.tgz.npm
	https://registry.npmjs.org/@tailwindcss/oxide/-/oxide-4.1.18.tgz
		-> npm-@tailwindcss+oxide-4.1.18.tgz.npm
	https://registry.npmjs.org/@tailwindcss/postcss/-/postcss-4.1.18.tgz
		-> npm-@tailwindcss+postcss-4.1.18.tgz.npm
	https://registry.npmjs.org/@testing-library/dom/-/dom-10.4.2.tgz
		-> npm-@testing-library+dom-10.4.2.tgz.npm
	https://registry.npmjs.org/@testing-library/react/-/react-16.3.3.tgz
		-> npm-@testing-library+react-16.3.3.tgz.npm
	https://registry.npmjs.org/@types/aria-query/-/aria-query-5.0.4.tgz
		-> npm-@types+aria-query-5.0.4.tgz.npm
	https://registry.npmjs.org/@types/babel__core/-/babel__core-7.20.5.tgz
		-> npm-@types+babel__core-7.20.5.tgz.npm
	https://registry.npmjs.org/@types/babel__generator/-/babel__generator-7.27.0.tgz
		-> npm-@types+babel__generator-7.27.0.tgz.npm
	https://registry.npmjs.org/@types/babel__template/-/babel__template-7.4.4.tgz
		-> npm-@types+babel__template-7.4.4.tgz.npm
	https://registry.npmjs.org/@types/babel__traverse/-/babel__traverse-7.28.0.tgz
		-> npm-@types+babel__traverse-7.28.0.tgz.npm
	https://registry.npmjs.org/@types/chai/-/chai-5.2.3.tgz
		-> npm-@types+chai-5.2.3.tgz.npm
	https://registry.npmjs.org/@types/debug/-/debug-4.1.13.tgz
		-> npm-@types+debug-4.1.13.tgz.npm
	https://registry.npmjs.org/@types/deep-eql/-/deep-eql-4.0.2.tgz
		-> npm-@types+deep-eql-4.0.2.tgz.npm
	https://registry.npmjs.org/@types/esrecurse/-/esrecurse-4.3.1.tgz
		-> npm-@types+esrecurse-4.3.1.tgz.npm
	https://registry.npmjs.org/@types/estree-jsx/-/estree-jsx-1.0.5.tgz
		-> npm-@types+estree-jsx-1.0.5.tgz.npm
	https://registry.npmjs.org/@types/estree/-/estree-1.0.8.tgz
		-> npm-@types+estree-1.0.8.tgz.npm
	https://registry.npmjs.org/@types/hast/-/hast-3.0.4.tgz
		-> npm-@types+hast-3.0.4.tgz.npm
	https://registry.npmjs.org/@types/ini/-/ini-4.1.1.tgz
		-> npm-@types+ini-4.1.1.tgz.npm
	https://registry.npmjs.org/@types/json-schema/-/json-schema-7.0.15.tgz
		-> npm-@types+json-schema-7.0.15.tgz.npm
	https://registry.npmjs.org/@types/mdast/-/mdast-4.0.4.tgz
		-> npm-@types+mdast-4.0.4.tgz.npm
	https://registry.npmjs.org/@types/ms/-/ms-2.1.0.tgz
		-> npm-@types+ms-2.1.0.tgz.npm
	https://registry.npmjs.org/@types/prop-types/-/prop-types-15.7.15.tgz
		-> npm-@types+prop-types-15.7.15.tgz.npm
	https://registry.npmjs.org/@types/react-dom/-/react-dom-18.3.7.tgz
		-> npm-@types+react-dom-18.3.7.tgz.npm
	https://registry.npmjs.org/@types/react/-/react-18.3.27.tgz
		-> npm-@types+react-18.3.27.tgz.npm
	https://registry.npmjs.org/@types/trusted-types/-/trusted-types-2.0.7.tgz
		-> npm-@types+trusted-types-2.0.7.tgz.npm
	https://registry.npmjs.org/@types/unist/-/unist-2.0.11.tgz
		-> npm-@types+unist-2.0.11.tgz.npm
	https://registry.npmjs.org/@types/unist/-/unist-3.0.3.tgz
		-> npm-@types+unist-3.0.3.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/eslint-plugin/-/eslint-plugin-8.71.0.tgz
		-> npm-@typescript-eslint+eslint-plugin-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/parser/-/parser-8.71.0.tgz
		-> npm-@typescript-eslint+parser-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/project-service/-/project-service-8.71.0.tgz
		-> npm-@typescript-eslint+project-service-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/scope-manager/-/scope-manager-8.71.0.tgz
		-> npm-@typescript-eslint+scope-manager-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/tsconfig-utils/-/tsconfig-utils-8.71.0.tgz
		-> npm-@typescript-eslint+tsconfig-utils-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/type-utils/-/type-utils-8.71.0.tgz
		-> npm-@typescript-eslint+type-utils-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/types/-/types-8.71.0.tgz
		-> npm-@typescript-eslint+types-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/typescript-estree/-/typescript-estree-8.71.0.tgz
		-> npm-@typescript-eslint+typescript-estree-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/utils/-/utils-8.71.0.tgz
		-> npm-@typescript-eslint+utils-8.71.0.tgz.npm
	https://registry.npmjs.org/@typescript-eslint/visitor-keys/-/visitor-keys-8.71.0.tgz
		-> npm-@typescript-eslint+visitor-keys-8.71.0.tgz.npm
	https://registry.npmjs.org/@ungap/structured-clone/-/structured-clone-1.3.1.tgz
		-> npm-@ungap+structured-clone-1.3.1.tgz.npm
	https://registry.npmjs.org/@vitejs/plugin-react/-/plugin-react-4.7.0.tgz
		-> npm-@vitejs+plugin-react-4.7.0.tgz.npm
	https://registry.npmjs.org/@vitest/coverage-v8/-/coverage-v8-3.2.7.tgz
		-> npm-@vitest+coverage-v8-3.2.7.tgz.npm
	https://registry.npmjs.org/@vitest/expect/-/expect-3.2.7.tgz
		-> npm-@vitest+expect-3.2.7.tgz.npm
	https://registry.npmjs.org/@vitest/mocker/-/mocker-3.2.7.tgz
		-> npm-@vitest+mocker-3.2.7.tgz.npm
	https://registry.npmjs.org/@vitest/pretty-format/-/pretty-format-3.2.7.tgz
		-> npm-@vitest+pretty-format-3.2.7.tgz.npm
	https://registry.npmjs.org/@vitest/runner/-/runner-3.2.7.tgz
		-> npm-@vitest+runner-3.2.7.tgz.npm
	https://registry.npmjs.org/@vitest/snapshot/-/snapshot-3.2.7.tgz
		-> npm-@vitest+snapshot-3.2.7.tgz.npm
	https://registry.npmjs.org/@vitest/spy/-/spy-3.2.7.tgz
		-> npm-@vitest+spy-3.2.7.tgz.npm
	https://registry.npmjs.org/@vitest/utils/-/utils-3.2.7.tgz
		-> npm-@vitest+utils-3.2.7.tgz.npm
	https://registry.npmjs.org/@wailsio/runtime/-/runtime-3.0.0-beta.26.tgz
		-> npm-@wailsio+runtime-3.0.0-beta.26.tgz.npm
	https://registry.npmjs.org/@xterm/addon-fit/-/addon-fit-0.10.0.tgz
		-> npm-@xterm+addon-fit-0.10.0.tgz.npm
	https://registry.npmjs.org/@xterm/xterm/-/xterm-5.5.0.tgz
		-> npm-@xterm+xterm-5.5.0.tgz.npm
	https://registry.npmjs.org/acorn-jsx/-/acorn-jsx-5.3.2.tgz
		-> npm-acorn-jsx-5.3.2.tgz.npm
	https://registry.npmjs.org/acorn/-/acorn-8.18.0.tgz
		-> npm-acorn-8.18.0.tgz.npm
	https://registry.npmjs.org/ajv/-/ajv-6.15.0.tgz
		-> npm-ajv-6.15.0.tgz.npm
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz
		-> npm-ansi-regex-5.0.1.tgz.npm
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-6.4.0.tgz
		-> npm-ansi-regex-6.4.0.tgz.npm
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz
		-> npm-ansi-styles-4.3.0.tgz.npm
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-5.2.0.tgz
		-> npm-ansi-styles-5.2.0.tgz.npm
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-6.2.3.tgz
		-> npm-ansi-styles-6.2.3.tgz.npm
	https://registry.npmjs.org/aria-hidden/-/aria-hidden-1.2.6.tgz
		-> npm-aria-hidden-1.2.6.tgz.npm
	https://registry.npmjs.org/aria-query/-/aria-query-5.3.0.tgz
		-> npm-aria-query-5.3.0.tgz.npm
	https://registry.npmjs.org/assertion-error/-/assertion-error-2.0.1.tgz
		-> npm-assertion-error-2.0.1.tgz.npm
	https://registry.npmjs.org/ast-v8-to-istanbul/-/ast-v8-to-istanbul-0.3.12.tgz
		-> npm-ast-v8-to-istanbul-0.3.12.tgz.npm
	https://registry.npmjs.org/autoprefixer/-/autoprefixer-10.4.23.tgz
		-> npm-autoprefixer-10.4.23.tgz.npm
	https://registry.npmjs.org/bail/-/bail-2.0.2.tgz
		-> npm-bail-2.0.2.tgz.npm
	https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz
		-> npm-balanced-match-1.0.2.tgz.npm
	https://registry.npmjs.org/balanced-match/-/balanced-match-4.0.4.tgz
		-> npm-balanced-match-4.0.4.tgz.npm
	https://registry.npmjs.org/baseline-browser-mapping/-/baseline-browser-mapping-2.9.11.tgz
		-> npm-baseline-browser-mapping-2.9.11.tgz.npm
	https://registry.npmjs.org/bidi-js/-/bidi-js-1.1.0.tgz
		-> npm-bidi-js-1.1.0.tgz.npm
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-2.1.7.tgz
		-> npm-brace-expansion-2.1.7.tgz.npm
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-5.0.12.tgz
		-> npm-brace-expansion-5.0.12.tgz.npm
	https://registry.npmjs.org/browserslist/-/browserslist-4.28.1.tgz
		-> npm-browserslist-4.28.1.tgz.npm
	https://registry.npmjs.org/cac/-/cac-6.7.14.tgz
		-> npm-cac-6.7.14.tgz.npm
	https://registry.npmjs.org/cacheable/-/cacheable-2.5.0.tgz
		-> npm-cacheable-2.5.0.tgz.npm
	https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001761.tgz
		-> npm-caniuse-lite-1.0.30001761.tgz.npm
	https://registry.npmjs.org/ccount/-/ccount-2.0.1.tgz
		-> npm-ccount-2.0.1.tgz.npm
	https://registry.npmjs.org/chai/-/chai-5.3.3.tgz
		-> npm-chai-5.3.3.tgz.npm
	https://registry.npmjs.org/character-entities-html4/-/character-entities-html4-2.1.0.tgz
		-> npm-character-entities-html4-2.1.0.tgz.npm
	https://registry.npmjs.org/character-entities-legacy/-/character-entities-legacy-3.0.0.tgz
		-> npm-character-entities-legacy-3.0.0.tgz.npm
	https://registry.npmjs.org/character-entities/-/character-entities-2.0.2.tgz
		-> npm-character-entities-2.0.2.tgz.npm
	https://registry.npmjs.org/character-reference-invalid/-/character-reference-invalid-2.0.1.tgz
		-> npm-character-reference-invalid-2.0.1.tgz.npm
	https://registry.npmjs.org/check-error/-/check-error-2.1.3.tgz
		-> npm-check-error-2.1.3.tgz.npm
	https://registry.npmjs.org/class-variance-authority/-/class-variance-authority-0.7.1.tgz
		-> npm-class-variance-authority-0.7.1.tgz.npm
	https://registry.npmjs.org/clsx/-/clsx-2.1.1.tgz
		-> npm-clsx-2.1.1.tgz.npm
	https://registry.npmjs.org/cmdk/-/cmdk-1.1.1.tgz
		-> npm-cmdk-1.1.1.tgz.npm
	https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz
		-> npm-color-convert-2.0.1.tgz.npm
	https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz
		-> npm-color-name-1.1.4.tgz.npm
	https://registry.npmjs.org/comma-separated-tokens/-/comma-separated-tokens-2.0.3.tgz
		-> npm-comma-separated-tokens-2.0.3.tgz.npm
	https://registry.npmjs.org/convert-source-map/-/convert-source-map-2.0.0.tgz
		-> npm-convert-source-map-2.0.0.tgz.npm
	https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.6.tgz
		-> npm-cross-spawn-7.0.6.tgz.npm
	https://registry.npmjs.org/css-tree/-/css-tree-3.2.1.tgz
		-> npm-css-tree-3.2.1.tgz.npm
	https://registry.npmjs.org/csstype/-/csstype-3.2.3.tgz
		-> npm-csstype-3.2.3.tgz.npm
	https://registry.npmjs.org/data-urls/-/data-urls-7.0.0.tgz
		-> npm-data-urls-7.0.0.tgz.npm
	https://registry.npmjs.org/debug/-/debug-4.4.3.tgz
		-> npm-debug-4.4.3.tgz.npm
	https://registry.npmjs.org/decimal.js/-/decimal.js-10.6.0.tgz
		-> npm-decimal.js-10.6.0.tgz.npm
	https://registry.npmjs.org/decode-named-character-reference/-/decode-named-character-reference-1.3.0.tgz
		-> npm-decode-named-character-reference-1.3.0.tgz.npm
	https://registry.npmjs.org/deep-eql/-/deep-eql-5.0.2.tgz
		-> npm-deep-eql-5.0.2.tgz.npm
	https://registry.npmjs.org/deep-is/-/deep-is-0.1.4.tgz
		-> npm-deep-is-0.1.4.tgz.npm
	https://registry.npmjs.org/dequal/-/dequal-2.0.3.tgz
		-> npm-dequal-2.0.3.tgz.npm
	https://registry.npmjs.org/detect-libc/-/detect-libc-2.1.2.tgz
		-> npm-detect-libc-2.1.2.tgz.npm
	https://registry.npmjs.org/detect-node-es/-/detect-node-es-1.1.0.tgz
		-> npm-detect-node-es-1.1.0.tgz.npm
	https://registry.npmjs.org/devlop/-/devlop-1.1.0.tgz
		-> npm-devlop-1.1.0.tgz.npm
	https://registry.npmjs.org/dom-accessibility-api/-/dom-accessibility-api-0.5.16.tgz
		-> npm-dom-accessibility-api-0.5.16.tgz.npm
	https://registry.npmjs.org/dompurify/-/dompurify-3.2.7.tgz
		-> npm-dompurify-3.2.7.tgz.npm
	https://registry.npmjs.org/eastasianwidth/-/eastasianwidth-0.2.0.tgz
		-> npm-eastasianwidth-0.2.0.tgz.npm
	https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.5.267.tgz
		-> npm-electron-to-chromium-1.5.267.tgz.npm
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz
		-> npm-emoji-regex-8.0.0.tgz.npm
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-9.2.2.tgz
		-> npm-emoji-regex-9.2.2.tgz.npm
	https://registry.npmjs.org/enhanced-resolve/-/enhanced-resolve-5.18.4.tgz
		-> npm-enhanced-resolve-5.18.4.tgz.npm
	https://registry.npmjs.org/entities/-/entities-6.0.1.tgz
		-> npm-entities-6.0.1.tgz.npm
	https://registry.npmjs.org/entities/-/entities-8.1.0.tgz
		-> npm-entities-8.1.0.tgz.npm
	https://registry.npmjs.org/es-module-lexer/-/es-module-lexer-1.7.0.tgz
		-> npm-es-module-lexer-1.7.0.tgz.npm
	https://registry.npmjs.org/esbuild/-/esbuild-0.21.5.tgz
		-> npm-esbuild-0.21.5.tgz.npm
	https://registry.npmjs.org/escalade/-/escalade-3.2.0.tgz
		-> npm-escalade-3.2.0.tgz.npm
	https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
		-> npm-escape-string-regexp-4.0.0.tgz.npm
	https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-5.0.0.tgz
		-> npm-escape-string-regexp-5.0.0.tgz.npm
	https://registry.npmjs.org/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-7.1.1.tgz
		-> npm-eslint-plugin-react-hooks-7.1.1.tgz.npm
	https://registry.npmjs.org/eslint-scope/-/eslint-scope-9.1.2.tgz
		-> npm-eslint-scope-9.1.2.tgz.npm
	https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
		-> npm-eslint-visitor-keys-3.4.3.tgz.npm
	https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-5.0.1.tgz
		-> npm-eslint-visitor-keys-5.0.1.tgz.npm
	https://registry.npmjs.org/eslint/-/eslint-10.11.0.tgz
		-> npm-eslint-10.11.0.tgz.npm
	https://registry.npmjs.org/espree/-/espree-11.2.0.tgz
		-> npm-espree-11.2.0.tgz.npm
	https://registry.npmjs.org/esquery/-/esquery-1.7.0.tgz
		-> npm-esquery-1.7.0.tgz.npm
	https://registry.npmjs.org/esrecurse/-/esrecurse-4.3.0.tgz
		-> npm-esrecurse-4.3.0.tgz.npm
	https://registry.npmjs.org/estraverse/-/estraverse-5.3.0.tgz
		-> npm-estraverse-5.3.0.tgz.npm
	https://registry.npmjs.org/estree-util-is-identifier-name/-/estree-util-is-identifier-name-3.0.0.tgz
		-> npm-estree-util-is-identifier-name-3.0.0.tgz.npm
	https://registry.npmjs.org/estree-walker/-/estree-walker-3.0.3.tgz
		-> npm-estree-walker-3.0.3.tgz.npm
	https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz
		-> npm-esutils-2.0.3.tgz.npm
	https://registry.npmjs.org/expect-type/-/expect-type-1.4.0.tgz
		-> npm-expect-type-1.4.0.tgz.npm
	https://registry.npmjs.org/extend/-/extend-3.0.2.tgz
		-> npm-extend-3.0.2.tgz.npm
	https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
		-> npm-fast-deep-equal-3.1.3.tgz.npm
	https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
		-> npm-fast-json-stable-stringify-2.1.0.tgz.npm
	https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
		-> npm-fast-levenshtein-2.0.6.tgz.npm
	https://registry.npmjs.org/fdir/-/fdir-6.5.0.tgz
		-> npm-fdir-6.5.0.tgz.npm
	https://registry.npmjs.org/file-entry-cache/-/file-entry-cache-11.1.5.tgz
		-> npm-file-entry-cache-11.1.5.tgz.npm
	https://registry.npmjs.org/find-up/-/find-up-5.0.0.tgz
		-> npm-find-up-5.0.0.tgz.npm
	https://registry.npmjs.org/flat-cache/-/flat-cache-6.1.23.tgz
		-> npm-flat-cache-6.1.23.tgz.npm
	https://registry.npmjs.org/flatted/-/flatted-3.4.4.tgz
		-> npm-flatted-3.4.4.tgz.npm
	https://registry.npmjs.org/foreground-child/-/foreground-child-3.3.1.tgz
		-> npm-foreground-child-3.3.1.tgz.npm
	https://registry.npmjs.org/fraction.js/-/fraction.js-5.3.4.tgz
		-> npm-fraction.js-5.3.4.tgz.npm
	https://registry.npmjs.org/gensync/-/gensync-1.0.0-beta.2.tgz
		-> npm-gensync-1.0.0-beta.2.tgz.npm
	https://registry.npmjs.org/get-nonce/-/get-nonce-1.0.1.tgz
		-> npm-get-nonce-1.0.1.tgz.npm
	https://registry.npmjs.org/glob-parent/-/glob-parent-6.0.2.tgz
		-> npm-glob-parent-6.0.2.tgz.npm
	https://registry.npmjs.org/glob/-/glob-10.5.0.tgz
		-> npm-glob-10.5.0.tgz.npm
	https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz
		-> npm-graceful-fs-4.2.11.tgz.npm
	https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz
		-> npm-has-flag-4.0.0.tgz.npm
	https://registry.npmjs.org/hashery/-/hashery-1.5.1.tgz
		-> npm-hashery-1.5.1.tgz.npm
	https://registry.npmjs.org/hast-util-from-parse5/-/hast-util-from-parse5-8.0.3.tgz
		-> npm-hast-util-from-parse5-8.0.3.tgz.npm
	https://registry.npmjs.org/hast-util-parse-selector/-/hast-util-parse-selector-4.0.0.tgz
		-> npm-hast-util-parse-selector-4.0.0.tgz.npm
	https://registry.npmjs.org/hast-util-raw/-/hast-util-raw-9.1.0.tgz
		-> npm-hast-util-raw-9.1.0.tgz.npm
	https://registry.npmjs.org/hast-util-sanitize/-/hast-util-sanitize-5.0.2.tgz
		-> npm-hast-util-sanitize-5.0.2.tgz.npm
	https://registry.npmjs.org/hast-util-to-jsx-runtime/-/hast-util-to-jsx-runtime-2.3.6.tgz
		-> npm-hast-util-to-jsx-runtime-2.3.6.tgz.npm
	https://registry.npmjs.org/hast-util-to-parse5/-/hast-util-to-parse5-8.0.1.tgz
		-> npm-hast-util-to-parse5-8.0.1.tgz.npm
	https://registry.npmjs.org/hast-util-whitespace/-/hast-util-whitespace-3.0.0.tgz
		-> npm-hast-util-whitespace-3.0.0.tgz.npm
	https://registry.npmjs.org/hastscript/-/hastscript-9.0.1.tgz
		-> npm-hastscript-9.0.1.tgz.npm
	https://registry.npmjs.org/hermes-estree/-/hermes-estree-0.25.1.tgz
		-> npm-hermes-estree-0.25.1.tgz.npm
	https://registry.npmjs.org/hermes-parser/-/hermes-parser-0.25.1.tgz
		-> npm-hermes-parser-0.25.1.tgz.npm
	https://registry.npmjs.org/hookified/-/hookified-1.15.1.tgz
		-> npm-hookified-1.15.1.tgz.npm
	https://registry.npmjs.org/hookified/-/hookified-2.2.0.tgz
		-> npm-hookified-2.2.0.tgz.npm
	https://registry.npmjs.org/html-encoding-sniffer/-/html-encoding-sniffer-6.0.0.tgz
		-> npm-html-encoding-sniffer-6.0.0.tgz.npm
	https://registry.npmjs.org/html-escaper/-/html-escaper-2.0.2.tgz
		-> npm-html-escaper-2.0.2.tgz.npm
	https://registry.npmjs.org/html-url-attributes/-/html-url-attributes-3.0.1.tgz
		-> npm-html-url-attributes-3.0.1.tgz.npm
	https://registry.npmjs.org/html-void-elements/-/html-void-elements-3.0.0.tgz
		-> npm-html-void-elements-3.0.0.tgz.npm
	https://registry.npmjs.org/ignore/-/ignore-5.3.2.tgz
		-> npm-ignore-5.3.2.tgz.npm
	https://registry.npmjs.org/ignore/-/ignore-7.0.11.tgz
		-> npm-ignore-7.0.11.tgz.npm
	https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz
		-> npm-imurmurhash-0.1.4.tgz.npm
	https://registry.npmjs.org/ini/-/ini-6.0.0.tgz
		-> npm-ini-6.0.0.tgz.npm
	https://registry.npmjs.org/inline-style-parser/-/inline-style-parser-0.2.7.tgz
		-> npm-inline-style-parser-0.2.7.tgz.npm
	https://registry.npmjs.org/is-alphabetical/-/is-alphabetical-2.0.1.tgz
		-> npm-is-alphabetical-2.0.1.tgz.npm
	https://registry.npmjs.org/is-alphanumerical/-/is-alphanumerical-2.0.1.tgz
		-> npm-is-alphanumerical-2.0.1.tgz.npm
	https://registry.npmjs.org/is-decimal/-/is-decimal-2.0.1.tgz
		-> npm-is-decimal-2.0.1.tgz.npm
	https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz
		-> npm-is-extglob-2.1.1.tgz.npm
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
		-> npm-is-fullwidth-code-point-3.0.0.tgz.npm
	https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz
		-> npm-is-glob-4.0.3.tgz.npm
	https://registry.npmjs.org/is-hexadecimal/-/is-hexadecimal-2.0.1.tgz
		-> npm-is-hexadecimal-2.0.1.tgz.npm
	https://registry.npmjs.org/is-plain-obj/-/is-plain-obj-4.1.0.tgz
		-> npm-is-plain-obj-4.1.0.tgz.npm
	https://registry.npmjs.org/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz
		-> npm-is-potential-custom-element-name-1.0.1.tgz.npm
	https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz
		-> npm-isexe-2.0.0.tgz.npm
	https://registry.npmjs.org/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.2.tgz
		-> npm-istanbul-lib-coverage-3.2.2.tgz.npm
	https://registry.npmjs.org/istanbul-lib-report/-/istanbul-lib-report-3.0.1.tgz
		-> npm-istanbul-lib-report-3.0.1.tgz.npm
	https://registry.npmjs.org/istanbul-lib-source-maps/-/istanbul-lib-source-maps-5.0.6.tgz
		-> npm-istanbul-lib-source-maps-5.0.6.tgz.npm
	https://registry.npmjs.org/istanbul-reports/-/istanbul-reports-3.2.0.tgz
		-> npm-istanbul-reports-3.2.0.tgz.npm
	https://registry.npmjs.org/jackspeak/-/jackspeak-3.4.3.tgz
		-> npm-jackspeak-3.4.3.tgz.npm
	https://registry.npmjs.org/jiti/-/jiti-2.6.1.tgz
		-> npm-jiti-2.6.1.tgz.npm
	https://registry.npmjs.org/js-tokens/-/js-tokens-10.0.0.tgz
		-> npm-js-tokens-10.0.0.tgz.npm
	https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz
		-> npm-js-tokens-4.0.0.tgz.npm
	https://registry.npmjs.org/js-tokens/-/js-tokens-9.0.1.tgz
		-> npm-js-tokens-9.0.1.tgz.npm
	https://registry.npmjs.org/jsdom/-/jsdom-29.1.1.tgz
		-> npm-jsdom-29.1.1.tgz.npm
	https://registry.npmjs.org/jsesc/-/jsesc-3.1.0.tgz
		-> npm-jsesc-3.1.0.tgz.npm
	https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
		-> npm-json-schema-traverse-0.4.1.tgz.npm
	https://registry.npmjs.org/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
		-> npm-json-stable-stringify-without-jsonify-1.0.1.tgz.npm
	https://registry.npmjs.org/json5/-/json5-2.2.3.tgz
		-> npm-json5-2.2.3.tgz.npm
	https://registry.npmjs.org/keyv/-/keyv-5.6.0.tgz
		-> npm-keyv-5.6.0.tgz.npm
	https://registry.npmjs.org/levn/-/levn-0.4.1.tgz
		-> npm-levn-0.4.1.tgz.npm
	https://registry.npmjs.org/lightningcss/-/lightningcss-1.30.2.tgz
		-> npm-lightningcss-1.30.2.tgz.npm
	https://registry.npmjs.org/locate-path/-/locate-path-6.0.0.tgz
		-> npm-locate-path-6.0.0.tgz.npm
	https://registry.npmjs.org/longest-streak/-/longest-streak-3.1.0.tgz
		-> npm-longest-streak-3.1.0.tgz.npm
	https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz
		-> npm-loose-envify-1.4.0.tgz.npm
	https://registry.npmjs.org/loupe/-/loupe-3.2.1.tgz
		-> npm-loupe-3.2.1.tgz.npm
	https://registry.npmjs.org/lru-cache/-/lru-cache-10.4.3.tgz
		-> npm-lru-cache-10.4.3.tgz.npm
	https://registry.npmjs.org/lru-cache/-/lru-cache-11.5.3.tgz
		-> npm-lru-cache-11.5.3.tgz.npm
	https://registry.npmjs.org/lru-cache/-/lru-cache-5.1.1.tgz
		-> npm-lru-cache-5.1.1.tgz.npm
	https://registry.npmjs.org/lz-string/-/lz-string-1.5.0.tgz
		-> npm-lz-string-1.5.0.tgz.npm
	https://registry.npmjs.org/magic-string/-/magic-string-0.30.21.tgz
		-> npm-magic-string-0.30.21.tgz.npm
	https://registry.npmjs.org/magicast/-/magicast-0.3.5.tgz
		-> npm-magicast-0.3.5.tgz.npm
	https://registry.npmjs.org/make-dir/-/make-dir-4.0.0.tgz
		-> npm-make-dir-4.0.0.tgz.npm
	https://registry.npmjs.org/markdown-table/-/markdown-table-3.0.4.tgz
		-> npm-markdown-table-3.0.4.tgz.npm
	https://registry.npmjs.org/marked/-/marked-14.0.0.tgz
		-> npm-marked-14.0.0.tgz.npm
	https://registry.npmjs.org/mdast-util-find-and-replace/-/mdast-util-find-and-replace-3.0.2.tgz
		-> npm-mdast-util-find-and-replace-3.0.2.tgz.npm
	https://registry.npmjs.org/mdast-util-from-markdown/-/mdast-util-from-markdown-2.0.3.tgz
		-> npm-mdast-util-from-markdown-2.0.3.tgz.npm
	https://registry.npmjs.org/mdast-util-gfm-autolink-literal/-/mdast-util-gfm-autolink-literal-2.0.1.tgz
		-> npm-mdast-util-gfm-autolink-literal-2.0.1.tgz.npm
	https://registry.npmjs.org/mdast-util-gfm-footnote/-/mdast-util-gfm-footnote-2.1.0.tgz
		-> npm-mdast-util-gfm-footnote-2.1.0.tgz.npm
	https://registry.npmjs.org/mdast-util-gfm-strikethrough/-/mdast-util-gfm-strikethrough-2.0.0.tgz
		-> npm-mdast-util-gfm-strikethrough-2.0.0.tgz.npm
	https://registry.npmjs.org/mdast-util-gfm-table/-/mdast-util-gfm-table-2.0.0.tgz
		-> npm-mdast-util-gfm-table-2.0.0.tgz.npm
	https://registry.npmjs.org/mdast-util-gfm-task-list-item/-/mdast-util-gfm-task-list-item-2.0.0.tgz
		-> npm-mdast-util-gfm-task-list-item-2.0.0.tgz.npm
	https://registry.npmjs.org/mdast-util-gfm/-/mdast-util-gfm-3.1.0.tgz
		-> npm-mdast-util-gfm-3.1.0.tgz.npm
	https://registry.npmjs.org/mdast-util-mdx-expression/-/mdast-util-mdx-expression-2.0.1.tgz
		-> npm-mdast-util-mdx-expression-2.0.1.tgz.npm
	https://registry.npmjs.org/mdast-util-mdx-jsx/-/mdast-util-mdx-jsx-3.2.0.tgz
		-> npm-mdast-util-mdx-jsx-3.2.0.tgz.npm
	https://registry.npmjs.org/mdast-util-mdxjs-esm/-/mdast-util-mdxjs-esm-2.0.1.tgz
		-> npm-mdast-util-mdxjs-esm-2.0.1.tgz.npm
	https://registry.npmjs.org/mdast-util-phrasing/-/mdast-util-phrasing-4.1.0.tgz
		-> npm-mdast-util-phrasing-4.1.0.tgz.npm
	https://registry.npmjs.org/mdast-util-to-hast/-/mdast-util-to-hast-13.2.1.tgz
		-> npm-mdast-util-to-hast-13.2.1.tgz.npm
	https://registry.npmjs.org/mdast-util-to-markdown/-/mdast-util-to-markdown-2.1.2.tgz
		-> npm-mdast-util-to-markdown-2.1.2.tgz.npm
	https://registry.npmjs.org/mdast-util-to-string/-/mdast-util-to-string-4.0.0.tgz
		-> npm-mdast-util-to-string-4.0.0.tgz.npm
	https://registry.npmjs.org/mdn-data/-/mdn-data-2.27.1.tgz
		-> npm-mdn-data-2.27.1.tgz.npm
	https://registry.npmjs.org/micromark-core-commonmark/-/micromark-core-commonmark-2.0.3.tgz
		-> npm-micromark-core-commonmark-2.0.3.tgz.npm
	https://registry.npmjs.org/micromark-extension-gfm-autolink-literal/-/micromark-extension-gfm-autolink-literal-2.1.0.tgz
		-> npm-micromark-extension-gfm-autolink-literal-2.1.0.tgz.npm
	https://registry.npmjs.org/micromark-extension-gfm-footnote/-/micromark-extension-gfm-footnote-2.1.0.tgz
		-> npm-micromark-extension-gfm-footnote-2.1.0.tgz.npm
	https://registry.npmjs.org/micromark-extension-gfm-strikethrough/-/micromark-extension-gfm-strikethrough-2.1.0.tgz
		-> npm-micromark-extension-gfm-strikethrough-2.1.0.tgz.npm
	https://registry.npmjs.org/micromark-extension-gfm-table/-/micromark-extension-gfm-table-2.1.1.tgz
		-> npm-micromark-extension-gfm-table-2.1.1.tgz.npm
	https://registry.npmjs.org/micromark-extension-gfm-tagfilter/-/micromark-extension-gfm-tagfilter-2.0.0.tgz
		-> npm-micromark-extension-gfm-tagfilter-2.0.0.tgz.npm
	https://registry.npmjs.org/micromark-extension-gfm-task-list-item/-/micromark-extension-gfm-task-list-item-2.1.0.tgz
		-> npm-micromark-extension-gfm-task-list-item-2.1.0.tgz.npm
	https://registry.npmjs.org/micromark-extension-gfm/-/micromark-extension-gfm-3.0.0.tgz
		-> npm-micromark-extension-gfm-3.0.0.tgz.npm
	https://registry.npmjs.org/micromark-factory-destination/-/micromark-factory-destination-2.0.1.tgz
		-> npm-micromark-factory-destination-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-factory-label/-/micromark-factory-label-2.0.1.tgz
		-> npm-micromark-factory-label-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-factory-space/-/micromark-factory-space-2.0.1.tgz
		-> npm-micromark-factory-space-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-factory-title/-/micromark-factory-title-2.0.1.tgz
		-> npm-micromark-factory-title-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-factory-whitespace/-/micromark-factory-whitespace-2.0.1.tgz
		-> npm-micromark-factory-whitespace-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-character/-/micromark-util-character-2.1.1.tgz
		-> npm-micromark-util-character-2.1.1.tgz.npm
	https://registry.npmjs.org/micromark-util-chunked/-/micromark-util-chunked-2.0.1.tgz
		-> npm-micromark-util-chunked-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-classify-character/-/micromark-util-classify-character-2.0.1.tgz
		-> npm-micromark-util-classify-character-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-combine-extensions/-/micromark-util-combine-extensions-2.0.1.tgz
		-> npm-micromark-util-combine-extensions-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-decode-numeric-character-reference/-/micromark-util-decode-numeric-character-reference-2.0.2.tgz
		-> npm-micromark-util-decode-numeric-character-reference-2.0.2.tgz.npm
	https://registry.npmjs.org/micromark-util-decode-string/-/micromark-util-decode-string-2.0.1.tgz
		-> npm-micromark-util-decode-string-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-encode/-/micromark-util-encode-2.0.1.tgz
		-> npm-micromark-util-encode-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-html-tag-name/-/micromark-util-html-tag-name-2.0.1.tgz
		-> npm-micromark-util-html-tag-name-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-normalize-identifier/-/micromark-util-normalize-identifier-2.0.1.tgz
		-> npm-micromark-util-normalize-identifier-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-resolve-all/-/micromark-util-resolve-all-2.0.1.tgz
		-> npm-micromark-util-resolve-all-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-sanitize-uri/-/micromark-util-sanitize-uri-2.0.1.tgz
		-> npm-micromark-util-sanitize-uri-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-subtokenize/-/micromark-util-subtokenize-2.1.0.tgz
		-> npm-micromark-util-subtokenize-2.1.0.tgz.npm
	https://registry.npmjs.org/micromark-util-symbol/-/micromark-util-symbol-2.0.1.tgz
		-> npm-micromark-util-symbol-2.0.1.tgz.npm
	https://registry.npmjs.org/micromark-util-types/-/micromark-util-types-2.0.2.tgz
		-> npm-micromark-util-types-2.0.2.tgz.npm
	https://registry.npmjs.org/micromark/-/micromark-4.0.2.tgz
		-> npm-micromark-4.0.2.tgz.npm
	https://registry.npmjs.org/minimatch/-/minimatch-10.2.6.tgz
		-> npm-minimatch-10.2.6.tgz.npm
	https://registry.npmjs.org/minimatch/-/minimatch-9.0.9.tgz
		-> npm-minimatch-9.0.9.tgz.npm
	https://registry.npmjs.org/minipass/-/minipass-7.1.3.tgz
		-> npm-minipass-7.1.3.tgz.npm
	https://registry.npmjs.org/monaco-editor/-/monaco-editor-0.55.1.tgz
		-> npm-monaco-editor-0.55.1.tgz.npm
	https://registry.npmjs.org/ms/-/ms-2.1.3.tgz
		-> npm-ms-2.1.3.tgz.npm
	https://registry.npmjs.org/nanoid/-/nanoid-3.3.11.tgz
		-> npm-nanoid-3.3.11.tgz.npm
	https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz
		-> npm-natural-compare-1.4.0.tgz.npm
	https://registry.npmjs.org/node-releases/-/node-releases-2.0.27.tgz
		-> npm-node-releases-2.0.27.tgz.npm
	https://registry.npmjs.org/optionator/-/optionator-0.9.4.tgz
		-> npm-optionator-0.9.4.tgz.npm
	https://registry.npmjs.org/p-limit/-/p-limit-3.1.0.tgz
		-> npm-p-limit-3.1.0.tgz.npm
	https://registry.npmjs.org/p-locate/-/p-locate-5.0.0.tgz
		-> npm-p-locate-5.0.0.tgz.npm
	https://registry.npmjs.org/package-json-from-dist/-/package-json-from-dist-1.0.1.tgz
		-> npm-package-json-from-dist-1.0.1.tgz.npm
	https://registry.npmjs.org/parse-entities/-/parse-entities-4.0.2.tgz
		-> npm-parse-entities-4.0.2.tgz.npm
	https://registry.npmjs.org/parse5/-/parse5-7.3.0.tgz
		-> npm-parse5-7.3.0.tgz.npm
	https://registry.npmjs.org/parse5/-/parse5-8.0.1.tgz
		-> npm-parse5-8.0.1.tgz.npm
	https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz
		-> npm-path-exists-4.0.0.tgz.npm
	https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz
		-> npm-path-key-3.1.1.tgz.npm
	https://registry.npmjs.org/path-scurry/-/path-scurry-1.11.1.tgz
		-> npm-path-scurry-1.11.1.tgz.npm
	https://registry.npmjs.org/pathe/-/pathe-2.0.3.tgz
		-> npm-pathe-2.0.3.tgz.npm
	https://registry.npmjs.org/pathval/-/pathval-2.0.1.tgz
		-> npm-pathval-2.0.1.tgz.npm
	https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz
		-> npm-picocolors-1.1.1.tgz.npm
	https://registry.npmjs.org/picomatch/-/picomatch-4.0.7.tgz
		-> npm-picomatch-4.0.7.tgz.npm
	https://registry.npmjs.org/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz
		-> npm-postcss-value-parser-4.2.0.tgz.npm
	https://registry.npmjs.org/postcss/-/postcss-8.5.6.tgz
		-> npm-postcss-8.5.6.tgz.npm
	https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.2.1.tgz
		-> npm-prelude-ls-1.2.1.tgz.npm
	https://registry.npmjs.org/pretty-format/-/pretty-format-27.5.1.tgz
		-> npm-pretty-format-27.5.1.tgz.npm
	https://registry.npmjs.org/property-information/-/property-information-7.1.0.tgz
		-> npm-property-information-7.1.0.tgz.npm
	https://registry.npmjs.org/punycode/-/punycode-2.3.1.tgz
		-> npm-punycode-2.3.1.tgz.npm
	https://registry.npmjs.org/qified/-/qified-0.10.1.tgz
		-> npm-qified-0.10.1.tgz.npm
	https://registry.npmjs.org/react-dom/-/react-dom-18.3.1.tgz
		-> npm-react-dom-18.3.1.tgz.npm
	https://registry.npmjs.org/react-is/-/react-is-17.0.2.tgz
		-> npm-react-is-17.0.2.tgz.npm
	https://registry.npmjs.org/react-markdown/-/react-markdown-10.1.0.tgz
		-> npm-react-markdown-10.1.0.tgz.npm
	https://registry.npmjs.org/react-refresh/-/react-refresh-0.17.0.tgz
		-> npm-react-refresh-0.17.0.tgz.npm
	https://registry.npmjs.org/react-remove-scroll-bar/-/react-remove-scroll-bar-2.3.8.tgz
		-> npm-react-remove-scroll-bar-2.3.8.tgz.npm
	https://registry.npmjs.org/react-remove-scroll/-/react-remove-scroll-2.7.2.tgz
		-> npm-react-remove-scroll-2.7.2.tgz.npm
	https://registry.npmjs.org/react-style-singleton/-/react-style-singleton-2.2.3.tgz
		-> npm-react-style-singleton-2.2.3.tgz.npm
	https://registry.npmjs.org/react/-/react-18.3.1.tgz
		-> npm-react-18.3.1.tgz.npm
	https://registry.npmjs.org/rehype-raw/-/rehype-raw-7.0.0.tgz
		-> npm-rehype-raw-7.0.0.tgz.npm
	https://registry.npmjs.org/rehype-sanitize/-/rehype-sanitize-6.0.0.tgz
		-> npm-rehype-sanitize-6.0.0.tgz.npm
	https://registry.npmjs.org/remark-gfm/-/remark-gfm-4.0.1.tgz
		-> npm-remark-gfm-4.0.1.tgz.npm
	https://registry.npmjs.org/remark-parse/-/remark-parse-11.0.0.tgz
		-> npm-remark-parse-11.0.0.tgz.npm
	https://registry.npmjs.org/remark-rehype/-/remark-rehype-11.1.2.tgz
		-> npm-remark-rehype-11.1.2.tgz.npm
	https://registry.npmjs.org/remark-stringify/-/remark-stringify-11.0.0.tgz
		-> npm-remark-stringify-11.0.0.tgz.npm
	https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz
		-> npm-require-from-string-2.0.2.tgz.npm
	https://registry.npmjs.org/rollup/-/rollup-4.54.0.tgz
		-> npm-rollup-4.54.0.tgz.npm
	https://registry.npmjs.org/saxes/-/saxes-6.0.0.tgz
		-> npm-saxes-6.0.0.tgz.npm
	https://registry.npmjs.org/scheduler/-/scheduler-0.23.2.tgz
		-> npm-scheduler-0.23.2.tgz.npm
	https://registry.npmjs.org/semver/-/semver-6.3.1.tgz
		-> npm-semver-6.3.1.tgz.npm
	https://registry.npmjs.org/semver/-/semver-7.8.5.tgz
		-> npm-semver-7.8.5.tgz.npm
	https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz
		-> npm-shebang-command-2.0.0.tgz.npm
	https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz
		-> npm-shebang-regex-3.0.0.tgz.npm
	https://registry.npmjs.org/siginfo/-/siginfo-2.0.0.tgz
		-> npm-siginfo-2.0.0.tgz.npm
	https://registry.npmjs.org/signal-exit/-/signal-exit-4.1.0.tgz
		-> npm-signal-exit-4.1.0.tgz.npm
	https://registry.npmjs.org/sonner/-/sonner-2.0.7.tgz
		-> npm-sonner-2.0.7.tgz.npm
	https://registry.npmjs.org/source-map-js/-/source-map-js-1.2.1.tgz
		-> npm-source-map-js-1.2.1.tgz.npm
	https://registry.npmjs.org/space-separated-tokens/-/space-separated-tokens-2.0.2.tgz
		-> npm-space-separated-tokens-2.0.2.tgz.npm
	https://registry.npmjs.org/stackback/-/stackback-0.0.2.tgz
		-> npm-stackback-0.0.2.tgz.npm
	https://registry.npmjs.org/state-local/-/state-local-1.0.7.tgz
		-> npm-state-local-1.0.7.tgz.npm
	https://registry.npmjs.org/std-env/-/std-env-3.10.0.tgz
		-> npm-std-env-3.10.0.tgz.npm
	https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz
		-> npm-string-width-4.2.3.tgz.npm
	https://registry.npmjs.org/string-width/-/string-width-5.1.2.tgz
		-> npm-string-width-5.1.2.tgz.npm
	https://registry.npmjs.org/stringify-entities/-/stringify-entities-4.0.4.tgz
		-> npm-stringify-entities-4.0.4.tgz.npm
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz
		-> npm-strip-ansi-6.0.1.tgz.npm
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-7.2.0.tgz
		-> npm-strip-ansi-7.2.0.tgz.npm
	https://registry.npmjs.org/strip-literal/-/strip-literal-3.1.0.tgz
		-> npm-strip-literal-3.1.0.tgz.npm
	https://registry.npmjs.org/style-to-js/-/style-to-js-1.1.21.tgz
		-> npm-style-to-js-1.1.21.tgz.npm
	https://registry.npmjs.org/style-to-object/-/style-to-object-1.0.14.tgz
		-> npm-style-to-object-1.0.14.tgz.npm
	https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz
		-> npm-supports-color-7.2.0.tgz.npm
	https://registry.npmjs.org/symbol-tree/-/symbol-tree-3.2.4.tgz
		-> npm-symbol-tree-3.2.4.tgz.npm
	https://registry.npmjs.org/tailwind-merge/-/tailwind-merge-2.6.0.tgz
		-> npm-tailwind-merge-2.6.0.tgz.npm
	https://registry.npmjs.org/tailwindcss/-/tailwindcss-4.1.18.tgz
		-> npm-tailwindcss-4.1.18.tgz.npm
	https://registry.npmjs.org/tapable/-/tapable-2.3.0.tgz
		-> npm-tapable-2.3.0.tgz.npm
	https://registry.npmjs.org/test-exclude/-/test-exclude-7.0.2.tgz
		-> npm-test-exclude-7.0.2.tgz.npm
	https://registry.npmjs.org/tinybench/-/tinybench-2.9.0.tgz
		-> npm-tinybench-2.9.0.tgz.npm
	https://registry.npmjs.org/tinyexec/-/tinyexec-0.3.2.tgz
		-> npm-tinyexec-0.3.2.tgz.npm
	https://registry.npmjs.org/tinyglobby/-/tinyglobby-0.2.17.tgz
		-> npm-tinyglobby-0.2.17.tgz.npm
	https://registry.npmjs.org/tinypool/-/tinypool-1.1.1.tgz
		-> npm-tinypool-1.1.1.tgz.npm
	https://registry.npmjs.org/tinyrainbow/-/tinyrainbow-2.0.0.tgz
		-> npm-tinyrainbow-2.0.0.tgz.npm
	https://registry.npmjs.org/tinyspy/-/tinyspy-4.0.6.tgz
		-> npm-tinyspy-4.0.6.tgz.npm
	https://registry.npmjs.org/tldts-core/-/tldts-core-7.4.16.tgz
		-> npm-tldts-core-7.4.16.tgz.npm
	https://registry.npmjs.org/tldts/-/tldts-7.4.16.tgz
		-> npm-tldts-7.4.16.tgz.npm
	https://registry.npmjs.org/tough-cookie/-/tough-cookie-6.0.2.tgz
		-> npm-tough-cookie-6.0.2.tgz.npm
	https://registry.npmjs.org/tr46/-/tr46-6.0.0.tgz
		-> npm-tr46-6.0.0.tgz.npm
	https://registry.npmjs.org/trim-lines/-/trim-lines-3.0.1.tgz
		-> npm-trim-lines-3.0.1.tgz.npm
	https://registry.npmjs.org/trough/-/trough-2.2.0.tgz
		-> npm-trough-2.2.0.tgz.npm
	https://registry.npmjs.org/ts-api-utils/-/ts-api-utils-2.5.0.tgz
		-> npm-ts-api-utils-2.5.0.tgz.npm
	https://registry.npmjs.org/tslib/-/tslib-2.8.1.tgz
		-> npm-tslib-2.8.1.tgz.npm
	https://registry.npmjs.org/tw-animate-css/-/tw-animate-css-1.4.0.tgz
		-> npm-tw-animate-css-1.4.0.tgz.npm
	https://registry.npmjs.org/type-check/-/type-check-0.4.0.tgz
		-> npm-type-check-0.4.0.tgz.npm
	https://registry.npmjs.org/typescript-eslint/-/typescript-eslint-8.71.0.tgz
		-> npm-typescript-eslint-8.71.0.tgz.npm
	https://registry.npmjs.org/typescript/-/typescript-5.9.3.tgz
		-> npm-typescript-5.9.3.tgz.npm
	https://registry.npmjs.org/undici/-/undici-7.30.0.tgz
		-> npm-undici-7.30.0.tgz.npm
	https://registry.npmjs.org/unified/-/unified-11.0.5.tgz
		-> npm-unified-11.0.5.tgz.npm
	https://registry.npmjs.org/unist-util-is/-/unist-util-is-6.0.1.tgz
		-> npm-unist-util-is-6.0.1.tgz.npm
	https://registry.npmjs.org/unist-util-position/-/unist-util-position-5.0.0.tgz
		-> npm-unist-util-position-5.0.0.tgz.npm
	https://registry.npmjs.org/unist-util-stringify-position/-/unist-util-stringify-position-4.0.0.tgz
		-> npm-unist-util-stringify-position-4.0.0.tgz.npm
	https://registry.npmjs.org/unist-util-visit-parents/-/unist-util-visit-parents-6.0.2.tgz
		-> npm-unist-util-visit-parents-6.0.2.tgz.npm
	https://registry.npmjs.org/unist-util-visit/-/unist-util-visit-5.1.0.tgz
		-> npm-unist-util-visit-5.1.0.tgz.npm
	https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.2.3.tgz
		-> npm-update-browserslist-db-1.2.3.tgz.npm
	https://registry.npmjs.org/uri-js/-/uri-js-4.4.1.tgz
		-> npm-uri-js-4.4.1.tgz.npm
	https://registry.npmjs.org/use-callback-ref/-/use-callback-ref-1.3.3.tgz
		-> npm-use-callback-ref-1.3.3.tgz.npm
	https://registry.npmjs.org/use-sidecar/-/use-sidecar-1.1.3.tgz
		-> npm-use-sidecar-1.1.3.tgz.npm
	https://registry.npmjs.org/vfile-location/-/vfile-location-5.0.3.tgz
		-> npm-vfile-location-5.0.3.tgz.npm
	https://registry.npmjs.org/vfile-message/-/vfile-message-4.0.3.tgz
		-> npm-vfile-message-4.0.3.tgz.npm
	https://registry.npmjs.org/vfile/-/vfile-6.0.3.tgz
		-> npm-vfile-6.0.3.tgz.npm
	https://registry.npmjs.org/vite-node/-/vite-node-3.2.4.tgz
		-> npm-vite-node-3.2.4.tgz.npm
	https://registry.npmjs.org/vite/-/vite-5.4.21.tgz
		-> npm-vite-5.4.21.tgz.npm
	https://registry.npmjs.org/vitest/-/vitest-3.2.7.tgz
		-> npm-vitest-3.2.7.tgz.npm
	https://registry.npmjs.org/w3c-xmlserializer/-/w3c-xmlserializer-5.0.0.tgz
		-> npm-w3c-xmlserializer-5.0.0.tgz.npm
	https://registry.npmjs.org/web-namespaces/-/web-namespaces-2.0.1.tgz
		-> npm-web-namespaces-2.0.1.tgz.npm
	https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-8.0.1.tgz
		-> npm-webidl-conversions-8.0.1.tgz.npm
	https://registry.npmjs.org/whatwg-mimetype/-/whatwg-mimetype-5.0.0.tgz
		-> npm-whatwg-mimetype-5.0.0.tgz.npm
	https://registry.npmjs.org/whatwg-url/-/whatwg-url-16.0.1.tgz
		-> npm-whatwg-url-16.0.1.tgz.npm
	https://registry.npmjs.org/which/-/which-2.0.2.tgz
		-> npm-which-2.0.2.tgz.npm
	https://registry.npmjs.org/why-is-node-running/-/why-is-node-running-2.3.0.tgz
		-> npm-why-is-node-running-2.3.0.tgz.npm
	https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.5.tgz
		-> npm-word-wrap-1.2.5.tgz.npm
	https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz
		-> npm-wrap-ansi-7.0.0.tgz.npm
	https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-8.1.0.tgz
		-> npm-wrap-ansi-8.1.0.tgz.npm
	https://registry.npmjs.org/xml-name-validator/-/xml-name-validator-5.0.0.tgz
		-> npm-xml-name-validator-5.0.0.tgz.npm
	https://registry.npmjs.org/xmlchars/-/xmlchars-2.2.0.tgz
		-> npm-xmlchars-2.2.0.tgz.npm
	https://registry.npmjs.org/yallist/-/yallist-3.1.1.tgz
		-> npm-yallist-3.1.1.tgz.npm
	https://registry.npmjs.org/yocto-queue/-/yocto-queue-0.1.0.tgz
		-> npm-yocto-queue-0.1.0.tgz.npm
	https://registry.npmjs.org/zod-validation-error/-/zod-validation-error-4.0.2.tgz
		-> npm-zod-validation-error-4.0.2.tgz.npm
	https://registry.npmjs.org/zod/-/zod-4.6.5.tgz
		-> npm-zod-4.6.5.tgz.npm
	https://registry.npmjs.org/zwitch/-/zwitch-2.0.4.tgz
		-> npm-zwitch-2.0.4.tgz.npm
	amd64? (
		https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.21.5.tgz
			-> npm-@esbuild+linux-x64-0.21.5.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-x64-gnu/-/rollup-linux-x64-gnu-4.54.0.tgz
			-> npm-@rollup+rollup-linux-x64-gnu-4.54.0.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-x64-musl/-/rollup-linux-x64-musl-4.54.0.tgz
			-> npm-@rollup+rollup-linux-x64-musl-4.54.0.tgz.npm
		https://registry.npmjs.org/@tailwindcss/oxide-linux-x64-gnu/-/oxide-linux-x64-gnu-4.1.18.tgz
			-> npm-@tailwindcss+oxide-linux-x64-gnu-4.1.18.tgz.npm
		https://registry.npmjs.org/@tailwindcss/oxide-linux-x64-musl/-/oxide-linux-x64-musl-4.1.18.tgz
			-> npm-@tailwindcss+oxide-linux-x64-musl-4.1.18.tgz.npm
		https://registry.npmjs.org/lightningcss-linux-x64-gnu/-/lightningcss-linux-x64-gnu-1.30.2.tgz
			-> npm-lightningcss-linux-x64-gnu-1.30.2.tgz.npm
		https://registry.npmjs.org/lightningcss-linux-x64-musl/-/lightningcss-linux-x64-musl-1.30.2.tgz
			-> npm-lightningcss-linux-x64-musl-1.30.2.tgz.npm
	)
	arm64? (
		https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.21.5.tgz
			-> npm-@esbuild+linux-arm64-0.21.5.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-arm64-gnu/-/rollup-linux-arm64-gnu-4.54.0.tgz
			-> npm-@rollup+rollup-linux-arm64-gnu-4.54.0.tgz.npm
		https://registry.npmjs.org/@rollup/rollup-linux-arm64-musl/-/rollup-linux-arm64-musl-4.54.0.tgz
			-> npm-@rollup+rollup-linux-arm64-musl-4.54.0.tgz.npm
		https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-gnu/-/oxide-linux-arm64-gnu-4.1.18.tgz
			-> npm-@tailwindcss+oxide-linux-arm64-gnu-4.1.18.tgz.npm
		https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-musl/-/oxide-linux-arm64-musl-4.1.18.tgz
			-> npm-@tailwindcss+oxide-linux-arm64-musl-4.1.18.tgz.npm
		https://registry.npmjs.org/lightningcss-linux-arm64-gnu/-/lightningcss-linux-arm64-gnu-1.30.2.tgz
			-> npm-lightningcss-linux-arm64-gnu-1.30.2.tgz.npm
		https://registry.npmjs.org/lightningcss-linux-arm64-musl/-/lightningcss-linux-arm64-musl-1.30.2.tgz
			-> npm-lightningcss-linux-arm64-musl-1.30.2.tgz.npm
	)
"

# Go modules come straight from proxy.golang.org; the eclass's
# mirror://goproxy// URIs break on goproxy.io (see net-misc/rmapi).
SRC_URI="
	https://github.com/rmitchellscott/reManager/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://proxy.golang.org/github.com/wailsapp/wails/v3/@v/v${WAILS_PV}.zip
		-> wails-v3-${WAILS_PV}.zip
	${EGO_SUM_SRC_URI//mirror:\/\/goproxy\/\//https://proxy.golang.org/}
	${NPM_SRC_URI}
"
S="${WORKDIR}/reManager-${PV}"

LICENSE="GPL-3"
# Go modules and bundled frontend libraries
LICENSE+=" Apache-2.0 BSD BSD-2 ISC MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# Wails v3 defaults to GTK 4 / WebKitGTK 6.0 (its "gtk3" tag is not used)
DEPEND="
	dev-libs/glib:2
	gui-libs/gtk:4
	net-libs/libsoup:3.0
	net-libs/webkit-gtk:6
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-lang/go-1.26.3:=
	net-libs/nodejs[npm]
	virtual/pkgconfig
"

src_prepare() {
	default

	# Materialise the Wails fork the way scripts/prepare-wails-fork.sh does.
	# The patches only touch iOS/Android code, but applying them keeps the
	# tree identical to upstream's.
	mkdir third_party || die
	cp -r "${WORKDIR}"/github.com/wailsapp/wails/v3@v${WAILS_PV} \
		third_party/wails-v3 || die
	chmod -R u+w third_party/wails-v3 || die
	pushd third_party/wails-v3 >/dev/null || die
	eapply "${S}"/build/wails-patches
	popd >/dev/null || die
}

src_compile() {
	# Go would otherwise try to download the toolchain named in go.mod
	export GOTOOLCHAIN=local

	# Seed a private npm cache from the NPM_SRC_URI distfiles. npm only
	# accepts tarballs ending in .tgz, so link them without the .npm suffix.
	export npm_config_cache="${T}/npm-cache"
	export npm_config_offline=true
	export npm_config_audit=false npm_config_fund=false
	export npm_config_update_notifier=false
	local f tarballs=()
	mkdir "${T}"/npm-tarballs || die
	for f in ${A}; do
		[[ ${f} == npm-*.npm ]] || continue
		ln -s "${DISTDIR}/${f}" "${T}/npm-tarballs/${f%.npm}" || die
		tarballs+=( "${T}/npm-tarballs/${f%.npm}" )
	done
	npm cache add "${tarballs[@]}" || die

	# Install scripts are skipped: the native build tools (esbuild, rollup,
	# lightningcss, tailwind oxide) ship as per-platform npm packages and
	# need no postinstall step.
	npm ci --prefix=frontend --ignore-scripts || die
	# tsc + vite build into frontend/dist, which main.go embeds
	npm run build --prefix=frontend || die

	ego build -tags production -ldflags "-X main.version=v${PV}" -o reManager .
}

src_install() {
	dobin reManager

	# Same files the Flathub build installs
	domenu flatpak/${APP_ID}.desktop
	newicon -s scalable assets/icon.svg ${APP_ID}.svg
	insinto /usr/share/metainfo
	doins flatpak/${APP_ID}.metainfo.xml
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "saving device passwords (Secret Service keyring)" gnome-base/gnome-keyring
}
