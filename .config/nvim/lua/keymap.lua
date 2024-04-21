local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--NERDTreeToggle
keymap("n", "<C-n>", ":NERDTreeToggle<CR>", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "ss", "<C-u>sp<CR><C-w>j", opts)
keymap("n", "sv", "<C-u>vs<CR><C-w>l", opts)

