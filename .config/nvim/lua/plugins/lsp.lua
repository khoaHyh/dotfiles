return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
	},

	config = function()
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        local default_setup = function(server)
          require('lspconfig')[server].setup({
            capabilities = lsp_capabilities,
          })
        end

		local lspconfig = require("lspconfig")
		local mason = require("mason")
		require("mason-lspconfig").setup({
			ensure_installed = { "clangd", "gopls", "tsserver", "eslint", "lua_ls", "marksman" },
            handlers = { default_setup }
		})


		mason.setup()

		lspconfig.clangd.setup({})
		lspconfig.gopls.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.eslint.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.marksman.setup({})

        local cmp = require("cmp")
        cmp.setup({
          sources = {
            {name = 'nvim_lsp'},
          },
          mapping = cmp.mapping.preset.insert({
            -- Enter key confirms completion item
            ['<CR>'] = cmp.mapping.confirm({select = false}),

            -- Ctrl + space triggers completion menu
            ['<C-Space>'] = cmp.mapping.complete(),
          }),
        })

	end,
}
