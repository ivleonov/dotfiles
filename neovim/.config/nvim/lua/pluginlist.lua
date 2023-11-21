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
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim", priority = 1000 },
  { "fxn/vim-monochrome" },
  { "Pocco81/AutoSave.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({})
    end
  },
  { "tree-sitter/tree-sitter-ruby" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tree-sitter/tree-sitter" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate"
  },

  -- fzf
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      }
    }
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      -- For example makes LSP aware of `vim` variable
      { "folke/neodev.nvim" }
    },
  },

  -- EXPERIMENTING
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "tzachar/local-highlight.nvim",
    config = function()
      require("local-highlight").setup()
    end
  }
}
