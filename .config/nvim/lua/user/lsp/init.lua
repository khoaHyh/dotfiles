require("user.lsp.null-ls")
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()

Lspconfig = require "lspconfig"
Util = require "lspconfig/util"

-- After setting up mason-lspconfig you may set up servers via lspconfig
Lspconfig.sumneko_lua.setup {}
Lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = Util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
