return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        indicator = { style = 'underline' },
        buffer_close_icon = '',
        close_icon = '',
      },
    })
  end,
}
