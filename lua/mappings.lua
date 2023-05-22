local map = vim.keymap

-- Leader key
vim.g.mapleader = ' '

-- Utilities
map.set('n', ';', ':')
map.set('n', 'U', '<C-r>')
map.set('n', '<Esc>', '<cmd> noh <CR>')

-- Navigation
map.set('i', '<C-h>', '<Left>')
map.set('i', '<C-j>', '<Down>')
map.set('i', '<C-k>', '<Up>')
map.set('i', '<C-l>', '<Right>')

-- Buffers
map.set('n', '<Tab>', '<cmd> bn <CR>')
map.set('n', '<S-Tab>', '<cmd> bp <CR>')
map.set('n', '<leader>w', '<cmd> w <CR>')
map.set('n', '<leader>q', '<cmd> bd <CR>')
map.set('n', '<leader>Q', '<cmd> bd! <CR>')
map.set('n', '<leader>bv', '<cmd> vnew <CR>')
map.set('n', '<leader>bh', '<cmd> new <CR>')
map.set('n', '<leader>bn', '<cmd> enew <CR>')

-- Splits
map.set('n', '<leader>sh', '<cmd> split <CR>')
map.set('n', '<leader>sv', '<cmd> vsplit <CR>')
map.set('n', '<leader>sh', '<C-w>h')
map.set('n', '<leader>sj', '<C-w>j')
map.set('n', '<leader>sk', '<C-w>k')
map.set('n', '<leader>sl', '<C-w>l')
map.set('n', '<C-=>', '<cmd> resize +1 <CR>')
map.set('n', '<C-->', '<cmd> resize -1 <CR>')
map.set('n', '<A-=>', '<cmd> vertical resize +1 <CR>')
map.set('n', '<A-->', '<cmd> vertical resize -1 <CR>')
