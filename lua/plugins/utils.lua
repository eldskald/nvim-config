return {
  {
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<leader>//',
          block = '<leader>cc',
        },
        opleader = {
          line = '<leader>/',
          block = '<leader>c',
        },
        extra = {
          above = '<leader>/O',
          below = '<leader>/o',
          eol = '<leader>/A',
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end,
  },
  { 'habamax/vim-godot' },
}
