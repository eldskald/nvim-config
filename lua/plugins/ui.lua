return {
  'akinsho/bufferline.nvim',
  version = '*',
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
