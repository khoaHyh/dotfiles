return {
    "nvim-lua/plenary.nvim",
    "sainnhe/gruvbox-material", -- colorscheme
    -- LSP START --
    "mfussenegger/nvim-lint",
    -- LSP END --
    "nvim-tree/nvim-web-devicons",
	"nvim-telescope/telescope-media-files.nvim",
	-- Comments
	"JoosepAlviste/nvim-ts-context-commentstring",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
}
