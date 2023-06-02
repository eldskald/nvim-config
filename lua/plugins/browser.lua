return {
  'luukvbaal/nnn.nvim',
  config = function()
    require('nnn').setup({
      picker = {
        cmd = 'tmux new-session nnn -Pp',
        style = { border = 'rounded' },
      },
    })
    vim.api.nvim_set_hl(0, 'NnnBorder', { bg = 'none' })
    vim.keymap.set('n', '<leader>e', '<cmd>NnnPicker<CR>')
  end,
}
