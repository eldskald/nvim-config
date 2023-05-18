require('options')
require('mappings')

local lazypath = vim.fn.stdpath('data') .. '/plugins.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', {
  ui = {
    icons = {
      cmd = '>_',
      config = '☼',
      event = '‼',
      ft = '.ft',
      init = '...',
      import = '{}',
      keys = '†',
      lazy = 'zzz',
      loaded = '+',
      not_loaded = '-',
      plugin = '',
      runtime = '»',
      source = '</>',
      start = '',
      task = '✓',
      list = {
        '•',
        '→',
        '*',
        '-',
      },
    },
  },
})
