return {
  {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_cursorline_transparent = false
      vim.g.nord_italic = true

      require("nord").set()
    end
  },
  { "fxn/vim-monochrome" },

  { "Pocco81/AutoSave.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end
  },
  { "tree-sitter/tree-sitter-ruby" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tree-sitter/tree-sitter" },
  { "nvim-treesitter/nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- fzf
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { {"nvim-lua/plenary.nvim"} }
  },

  -- EXPERIMENTING
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
