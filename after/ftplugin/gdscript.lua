vim.opt_local.expandtab = false
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

local cmp = require('cmp_nvim_lsp')
local lspprot = vim.lsp.protocol
require('lspconfig').gdscript.setup({
  capabilities = cmp.default_capabilities(lspprot.make_client_capabilities()),
})
require('cmp').setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})
