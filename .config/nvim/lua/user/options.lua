-- :help options to learn more
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

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")

vim.cmd([[colorscheme gruvbox-material]])
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_bold = "1"

vim.g.dashboard_default_executive = "telescope"
