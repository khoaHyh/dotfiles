return {
	"nvim-lua/plenary.nvim",
	"sainnhe/gruvbox-material", -- colorscheme
	"nvim-tree/nvim-web-devicons",
	"nvim-telescope/telescope-media-files.nvim",
	"williamboman/mason-lspconfig.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring", -- Comments
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
