require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all"
  ensure_installed = { "ruby", "yaml", "lua", "javascript", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  }
}

-- treesitter based folding
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/master#folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
