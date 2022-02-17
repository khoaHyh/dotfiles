-- keybindings --
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap

-- map Space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- resize windows with arrow keys
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- saving files
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)

--Telescope
map('n', '<leader>ff', "<Cmd>Telescope find_files<CR>", opts)
map('n', '<leader>fg', "<Cmd>Telescope live_grep<CR>", opts)
map('n', '<leader>fb', "<Cmd>Telescope buffers<CR>", opts)
map('n', '<leader>fh', "<Cmd>Telescope help_tags<CR>", opts)
