return {
  'voldikss/vim-floaterm',
  config = function()
    local map = vim.keymap
    map.set('n', '<F12>', '<cmd> FloatermToggle <CR>')
    map.set('t', '<F12>', '<C-\\><C-n>:FloatermToggle <CR>')
    map.set('n', '<F8>', '<cmd> FloatermKill <CR>')
    map.set('t', '<F8>', '<C-\\><C-n>:FloatermKill <CR>')
    map.set('n', '<F9>', '<cmd> FloatermNew <CR>')
    map.set('t', '<F9>', '<C-\\><C-n>:FloatermNew <CR>')
    map.set('n', '<F10>', '<cmd> FloatermNext <CR>')
    map.set('t', '<F10>', '<C-\\><C-n>:FloatermNext <CR>')
    map.set('n', '<F11>', '<cmd> FloatermPrev <CR>')
    map.set('t', '<F11>', '<C-\\><C-n>:FloatermPrev <CR>')
  end,
}
