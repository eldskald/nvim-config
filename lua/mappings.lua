local map = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- Utilities
map.set("n", ";", ":")
map.set("n", "<leader>e", "<cmd>Explore<cr>")

-- Buffers
map.set("n", "<tab>", "<cmd>bn<cr>")
map.set("n", "<S-tab>", "<cmd>bp<cr>")
map.set("n", "<leader>w", "<cmd>w<cr>")
map.set("n", "<leader>q", "<cmd>bd<cr>")
map.set("n", "<leader>bv", "<cmd>vnew<cr>")
map.set("n", "<leader>bh", "<cmd>new<cr>")
map.set("n", "<leader>bn", "<cmd>enew<cr>")

