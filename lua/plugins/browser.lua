return {
  'luukvbaal/nnn.nvim',
  config = function()
    vim.keymap.set('n', '<leader>e', '<cmd>NnnPicker<CR>')
    require('nnn').setup({
      picker = {
        cmd = 'tmux new-session nnn -Pp',
        style = { border = 'rounded' },
      },
    })
  end,
}
