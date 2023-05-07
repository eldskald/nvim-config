return {

  -- Dependencies
  {"nvim-lua/plenary.nvim"},
  {"nvim-tree/nvim-web-devicons"},

  -- LSP
  require("plugins.lsp"),

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
