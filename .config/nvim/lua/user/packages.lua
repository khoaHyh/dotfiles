-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- packages
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'burntsushi/ripgrep'
  use "akinsho/bufferline.nvim"
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'glepnir/dashboard-nvim'
  use 'marko-cerovac/material.nvim'

  -- colorscheme
  use 'sainnhe/gruvbox-material'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tamago324/nlsp-settings.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  use "windwp/nvim-autopairs"
  use 'p00f/nvim-ts-rainbow'
  use 'vimwiki/vimwiki'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'folke/which-key.nvim'

  -- comments
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  -- snippets
  use 'l3mon4d3/luasnip'
  use 'rafamadriz/friendly-snippets'

  -- git 
  use 'lewis6991/gitsigns.nvim'
end)


