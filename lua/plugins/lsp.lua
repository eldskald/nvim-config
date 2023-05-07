return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    {
      'williamboman/mason.nvim',
      build = ':MasonUpdate',
      config = function()
        require('mason').setup()
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' },
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    -- Linting and formatting
    { 'jose-elias-alvarez/null-ls.nvim' },
  },
  config = function()
    local lsp = require('lsp-zero').preset({
      name = 'minimal',
      manage_nvim_cmp = {
        set_basic_mappings = false,
        set_extra_mappings = false,
      },
    })

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set(
        'n',
        '<leader>wr',
        vim.lsp.buf.remove_workspace_folder,
        opts
      )
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>fm', function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end)

    lsp.set_sign_icons({
      error = 'X',
      warn = '!',
      hint = '?',
      info = 'i',
    })

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    -- Autocompletion
    local cmp = require('cmp')
    local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-;>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select_opts),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      },
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
    })

    -- Linting
    local null_ls = require('null-ls')
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
