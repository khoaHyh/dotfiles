return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Highlighting

		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"html",
					"typescript",
					"tsx",
					"go",
					"markdown",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
