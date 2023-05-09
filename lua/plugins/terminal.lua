return {
  'voldikss/vim-floaterm',
  config = function()
    local map = vim.keymap
    map.set('n', '<A-i>', '<cmd> FloatermToggle <CR>')
    map.set('t', '<A-i>', '<C-\\><C-n>:FloatermToggle <CR>')
    map.set('n', '<A-q>', '<cmd> FloatermKill <CR>')
    map.set('t', '<A-q>', '<C-\\><C-n>:FloatermKill <CR>')
    map.set('n', '<A-n>', '<cmd> FloatermNew <CR>')
    map.set('t', '<A-n>', '<C-\\><C-n>:FloatermNew <CR>')
    map.set('n', '<A-j>', '<cmd> FloatermNext <CR>')
    map.set('t', '<A-j>', '<C-\\><C-n>:FloatermNext <CR>')
    map.set('n', '<A-k>', '<cmd> FloatermPrev <CR>')
    map.set('t', '<A-k>', '<C-\\><C-n>:FloatermPrev <CR>')
  end,
}
