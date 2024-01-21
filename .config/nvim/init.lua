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
		
-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup("plugins")

-- set colorscheme after plugins are loaded
vim.cmd([[colorscheme gruvbox-material]])
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_bold = "1"

