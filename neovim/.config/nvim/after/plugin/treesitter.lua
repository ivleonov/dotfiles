require("nvim-treesitter").setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "ruby",
    "yaml",
    "sql"
  },
  auto_install = false,
  sync_install = false,
}

-- Highlight is now a Neovim built-in; enable it per filetype
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- treesitter based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
