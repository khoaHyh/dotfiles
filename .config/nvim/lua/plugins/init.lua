return {
	"nvim-lua/plenary.nvim",
	"sainnhe/gruvbox-material", -- colorscheme
	"sainnhe/everforest", -- colorscheme
	"nvim-tree/nvim-web-devicons",
	"nvim-telescope/telescope-media-files.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"JoosepAlviste/nvim-ts-context-commentstring", -- Comments
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
}
