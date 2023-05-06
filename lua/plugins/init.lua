return {

  -- Dependencies
  {"nvim-lua/plenary.nvim"},
  {"nvim-tree/nvim-web-devicons"},

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      {"neovim/nvim-lspconfig"},
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
      },
      {"williamboman/mason-lspconfig.nvim"},
      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"L3MON4D3/LuaSnip"},
      -- Linting and formatting
      {"jose-elias-alvarez/null-ls.nvim"},
    },
    config = function()
      require("plugins.lsp")
    end,
  },

  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Utilities
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("bufferline").setup{
        options = {
          indicator = { style = "underline" },
          buffer_close_icon = "",
          close_icon = "",
        }
      }
    end
  },
}
