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

