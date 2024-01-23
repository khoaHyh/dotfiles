return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		require("mason-lspconfig").setup()

		mason.setup()

		lspconfig.clangd.setup({})
		lspconfig.gopls.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.eslint.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.marksman.setup({})
	end,
}
