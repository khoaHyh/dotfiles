local options = {
	backup = false,
	termguicolors = true,
	cmdheight = 2,
	expandtab = true,
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	autoindent = true,
	number = true,
	clipboard = "unnamedplus",
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	updatetime = 300,
	writebackup = false,
	cursorline = true,
	relativenumber = false,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
}

-- set options via vimscript
for k, v in pairs(options) do
	vim.opt[k] = v
end
		
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  "folke/neodev.nvim",
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",

    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript", "tsx", "go" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
"sainnhe/gruvbox-material", 
})

-- set colorscheme
vim.cmd([[colorscheme gruvbox-material]])
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_bold = "1"

