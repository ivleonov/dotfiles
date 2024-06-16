-- Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.spell = true

-- local-highlight.nvim relies on CursorHold event which is emitted after
-- `updatetime` ms of inactivity. Default value is 4000 (4 seconds) which makes
-- experience with plugin a bit laggy
-- https://github.com/tzachar/local-highlight.nvim#how-the-plugin-works
vim.opt.updatetime = 500

-- highlight search result
vim.opt.hlsearch = true
vim.opt.colorcolumn = "81,101,121"
vim.opt.cursorline = true

-- Render Whitespaces
-- vim.opt.listchars="eol:↵,space:·,trail:~,tab:>-,nbsp:␣"
-- vim.opt.list = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- turn off breaking long lines
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

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "

-- Quicker window movement
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-^>", {})
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>e", ":Ex<CR>", {})

vim.api.nvim_set_keymap("n", "n", "nzz", {noremap = true})
vim.api.nvim_set_keymap("n", "N", "Nzz", {noremap = true})
vim.api.nvim_set_keymap("n", "*", "*zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>zz", {noremap = true})

-- TODO: Look / Wait for native way
vim.cmd [[command! -range=% FormatJSON <line1>,<line2>!jq "."]]

require "plugins"

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
