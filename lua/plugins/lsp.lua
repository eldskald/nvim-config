return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    {"neovim/nvim-lspconfig"},
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = function()
        require("mason").setup()
      end,
    },
    {"williamboman/mason-lspconfig.nvim"},
    -- Autocompletion
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"saadparwaiz1/cmp_luasnip"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-nvim-lua"},
    -- Snippets
    {"L3MON4D3/LuaSnip"},
    {"rafamadriz/friendly-snippets"},
    -- Linting and formatting
    {"jose-elias-alvarez/null-ls.nvim"},
  },
  config = function()
    local lsp = require("lsp-zero").preset({})

    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    -- Autocompletion
    local cmp = require("cmp")

    cmp.setup({
      mapping = {
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
        ["<C-;>"] = cmp.mapping.close(),
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
    })

    -- Linting
    local null_ls = require("null-ls")
    local b = null_ls.builtins

    null_ls.setup({
      debug = true,
      sources = {
        -- Linters
        b.diagnostics.eslint,
        -- Formatters
        b.formatting.prettier,
        b.formatting.stylua,
      },
    })
  end,
}

