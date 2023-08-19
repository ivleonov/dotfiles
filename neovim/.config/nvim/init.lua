-- Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.spell = true

--highlight search result
vim.opt.hlsearch = true
vim.opt.colorcolumn = "81,101,121"
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--turn off breaking long lines
vim.opt.wrap = false

-- Disable swap file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Search
vim.opt.ic = true -- ignore case
vim.opt.incsearch = true -- interactive

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "

-- Quicker window movement
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-^>", {})
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>e", ":e<CR>", {})
vim.api.nvim_set_keymap("n", "n", "nzz", {noremap = true})
vim.api.nvim_set_keymap("n", "N", "Nzz", {noremap = true})
vim.api.nvim_set_keymap("n", "*", "*zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>zz", {noremap = true})

-- TODO: Look / Wait for native way
vim.cmd [[command! -range=% FormatJSON <line1>,<line2>!jq "."]]

require "plugins"
