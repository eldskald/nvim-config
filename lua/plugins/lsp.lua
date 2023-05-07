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
    {"hrsh7th/cmp-nvim-lsp"},
    {"L3MON4D3/LuaSnip"},
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
        { name = "buffer" },
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

