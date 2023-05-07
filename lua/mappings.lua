local map = vim.keymap

-- Leader key
vim.g.mapleader = ' '

-- Utilities
map.set('n', ';', ':')
map.set('n', '<Esc>', '<cmd> noh <CR>')

-- Buffers
map.set('n', '<Tab>', '<cmd> bn <CR>')
map.set('n', '<S-Tab>', '<cmd> bp <CR>')
map.set('n', '<leader>w', '<cmd> w <CR>')
map.set('n', '<leader>q', '<cmd> bd <CR>')
map.set('n', '<leader>bv', '<cmd> vnew <CR>')
map.set('n', '<leader>bh', '<cmd> new <CR>')
map.set('n', '<leader>bn', '<cmd> enew <CR>')
