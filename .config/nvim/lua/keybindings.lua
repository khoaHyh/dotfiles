-- keybindings
local map = vim.api.nvim_set_keymap
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<CR>a', {})
local opts = { noremap = true }
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

--Telescope
map('n', '<leader>ff', "<Cmd>Telescope find_files<CR>", opts)
