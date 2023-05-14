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

require("packer").startup(function()
  use { "wbthomason/packer.nvim" }

  -- Color schemes
  use { "fxn/vim-monochrome" }
  use { "shaunsingh/nord.nvim" }

  use { "Pocco81/AutoSave.nvim" }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  use { "tpope/vim-surround" }
  use { "tpope/vim-fugitive" }

  use { "tree-sitter/tree-sitter" }
  use { "nvim-treesitter/nvim-treesitter" }

  -- fzf
  use { "junegunn/fzf" }
  use { "junegunn/fzf.vim" }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use { "voldikss/vim-translator" }
  use { "lewis6991/spellsitter.nvim" }

  -- EXPERIMENTING
  use { 'beauwilliams/focus.nvim' }
  use { "phaazon/hop.nvim", branch = "v2" }
end)

require("hop").setup({
  keys = "awersdfjiokvnucm"
})

require("focus").setup({
  number = false
})

-- config colorscheme ------------------
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_cursorline_transparent = false
vim.g.nord_italic = true
require("nord").set()
-----------------------------------------

require("lualine").setup()

require("spellsitter").setup {
  enable = true
}

require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all"
  ensure_installed = { "ruby", "yaml", "lua", "javascript", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
  -- indent = {
  --   enable = true
  -- }
}

-- treesitter based folding
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/master#folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Set Ukrainian as a target translate language for "voldikss/vim-translator"
vim.g.translator_target_lang="uk"

require("auto-save").setup {
  enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
  execution_message = {
    message = function() -- message to print on save
      return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    end,
    dim = 0.18, -- dim the color of `message`
    cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
  },
  trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
  -- function that determines whether to save the current buffer or not
  -- return true: if buffer is ok to be saved
  -- return false: if it's not ok to be saved
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")

    if
      fn.getbufvar(buf, "&modifiable") == 1 and
      utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
      return true -- met condition(s), can save
    end
    return false -- can't save
  end,
  debounce_delay = 135 -- saves the file at most every `debounce_delay` milliseconds
}

-- Quicker window movement
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-^>", {})
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>e", ":e<CR>", {})

vim.api.nvim_set_keymap("n", "n", "nzz", {noremap = true})
vim.api.nvim_set_keymap("n", "N", "Nzz", {noremap = true})
vim.api.nvim_set_keymap("n", "*", "*zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>zz", {noremap = true})

-- FZF.vim config
vim.api.nvim_set_keymap("n", "<C-p>", ":GFiles<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ag", ":Ag <C-R><C-W><CR>", {})
vim.api.nvim_set_keymap("n", "<leader>/", ":BLines<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>*", ":BLines <C-R><C-W><CR>", {})

-- Telescope config
-- Currently is disabled in favor of fzf.vim
vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope git_files<CR>", {})
-- vim.api.nvim_set_keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", {})
-- Search for word under cursor in current dir using exact match
-- vim.api.nvim_set_keymap("n", "<leader>*", ":Telescope grep_string word_match=-w search=<C-R><C-W><CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope git_files<CR>", {})

-- TODO: Look / Wait for native way
vim.cmd [[command! -range=% FormatJSON <line1>,<line2>!jq "."]]
