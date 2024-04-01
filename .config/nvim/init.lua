local options = {
	backup = false,
	termguicolors = true,
	cmdheight = 2,
	expandtab = true,
	shiftwidth = 2,
	softtabstop = 2,
	tabstop = 2,
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

require("config.keymaps") -- map b4 loading packages so we can use <Leader>
require("lazy-config")

-- set colorscheme after plugins are loaded
-- vim.cmd([[colorscheme gruvbox-material]])
-- vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_enable_bold = "1"

vim.g.everforest_background = "hard"
vim.cmd([[colorscheme everforest ]])
