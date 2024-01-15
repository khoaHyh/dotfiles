-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- packages
require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("burntsushi/ripgrep")
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("glepnir/dashboard-nvim")
	use("marko-cerovac/material.nvim")
	use("vimwiki/vimwiki")
	use("nvim-lualine/lualine.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use({"lukas-reineke/indent-blankline.nvim",
        config = function()
            require('ibl').setup({
                exclude = {
                    buftypes = { 'terminal' },
                    filetypes = { 'dashboard', 'NvimTree', 'packer', 'lsp-installer' }
                },
                scope = {
                    enabled = true,
                    show_end = true
                }
            })
        end
    })
	use("folke/which-key.nvim")
	use("folke/trouble.nvim")

	-- colorscheme
	use("sainnhe/gruvbox-material")

    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("windwp/nvim-autopairs")
	use("p00f/nvim-ts-rainbow")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")

	-- snippets
	use("l3mon4d3/luasnip")
	use("rafamadriz/friendly-snippets")

	-- git
	use("lewis6991/gitsigns.nvim")
end)
