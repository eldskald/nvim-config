return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local map = vim.keymap
      map.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
      map.set('n', '<leader>fg', '<cmd> Telescope live_grep <CR>')
      map.set('n', '<leader>fr', '<cmd> Telescope oldfiles <CR>')
      map.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
      map.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>')
      map.set('n', '<leader>fb', '<cmd> Telescope file_browser <CR>')

      local telescopeConfig = require('telescope.config')
      local vimgrep_arguments =
        { unpack(telescopeConfig.values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, '--hidden')
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')

      local telescope_actions = require('telescope.actions')
      local file_browser_actions =
        require('telescope._extensions.file_browser.actions')
      require('telescope').setup({
        pickers = {
          find_files = {
            find_command = {
              'rg',
              '--files',
              '--hidden',
              '--glob',
              '!**/.git/*',
            },
          },
        },
        mappings = {
          i = {
            ['<C-n>'] = telescope_actions.move_selection_next,
            ['<C-p>'] = telescope_actions.move_selection_previous,
            ['<C-c>'] = telescope_actions.close,
            ['<Down>'] = telescope_actions.move_selection_next,
            ['<Up>'] = telescope_actions.move_selection_previous,
            ['<CR>'] = telescope_actions.select_default,
            ['<C-x>'] = telescope_actions.select_horizontal,
            ['<C-v>'] = telescope_actions.select_vertical,
            ['<C-t>'] = telescope_actions.select_tab,
            ['<C-u>'] = telescope_actions.preview_scrolling_up,
            ['<C-d>'] = telescope_actions.preview_scrolling_down,
            ['<PageUp>'] = telescope_actions.results_scrolling_up,
            ['<PageDown>'] = telescope_actions.results_scrolling_down,
            ['<Tab>'] = telescope_actions.toggle_selection
              + telescope_actions.move_selection_worse,
            ['<S-Tab>'] = telescope_actions.toggle_selection
              + telescope_actions.move_selection_better,
            ['<C-q>'] = telescope_actions.send_to_qflist
              + telescope_actions.open_qflist,
            ['<M-q>'] = telescope_actions.send_selected_to_qflist
              + telescope_actions.open_qflist,
            ['<C-l>'] = telescope_actions.complete_tag,
            ['<C-/>'] = telescope_actions.which_key,
            ['<C-_>'] = telescope_actions.which_key,
            ['<C-w>'] = { '<c-s-w>', type = 'command' },
            ['<C-j>'] = telescope_actions.nop,
          },
          n = {
            ['<esc>'] = telescope_actions.close,
            ['<CR>'] = telescope_actions.select_default,
            ['<C-x>'] = telescope_actions.select_horizontal,
            ['<C-v>'] = telescope_actions.select_vertical,
            ['<C-t>'] = telescope_actions.select_tab,
            ['<Tab>'] = telescope_actions.toggle_selection
              + telescope_actions.move_selection_worse,
            ['<S-Tab>'] = telescope_actions.toggle_selection
              + telescope_actions.move_selection_better,
            ['<C-q>'] = telescope_actions.send_to_qflist
              + telescope_actions.open_qflist,
            ['<M-q>'] = telescope_actions.send_selected_to_qflist
              + telescope_actions.open_qflist,
            ['j'] = telescope_actions.move_selection_next,
            ['k'] = telescope_actions.move_selection_previous,
            ['H'] = telescope_actions.move_to_top,
            ['M'] = telescope_actions.move_to_middle,
            ['L'] = telescope_actions.move_to_bottom,
            ['<Down>'] = telescope_actions.move_selection_next,
            ['<Up>'] = telescope_actions.move_selection_previous,
            ['gg'] = telescope_actions.move_to_top,
            ['G'] = telescope_actions.move_to_bottom,
            ['<C-u>'] = telescope_actions.preview_scrolling_up,
            ['<C-d>'] = telescope_actions.preview_scrolling_down,
            ['<PageUp>'] = telescope_actions.results_scrolling_up,
            ['<PageDown>'] = telescope_actions.results_scrolling_down,
            ['?'] = telescope_actions.which_key,
          },
        },
        extensions = {
          file_browser = {
            mappings = {
              ['i'] = {
                ['<A-c>'] = file_browser_actions.create,
                ['<S-CR>'] = file_browser_actions.create_from_prompt,
                ['<A-r>'] = file_browser_actions.rename,
                ['<A-m>'] = file_browser_actions.move,
                ['<A-y>'] = file_browser_actions.copy,
                ['<A-d>'] = file_browser_actions.remove,
                ['<C-o>'] = file_browser_actions.open,
                ['<C-g>'] = file_browser_actions.goto_parent_dir,
                ['<C-e>'] = file_browser_actions.goto_home_dir,
                ['<C-w>'] = file_browser_actions.goto_cwd,
                ['<C-t>'] = file_browser_actions.change_cwd,
                ['<C-f>'] = file_browser_actions.toggle_browser,
                ['<C-h>'] = file_browser_actions.toggle_hidden,
                ['<C-s>'] = file_browser_actions.toggle_all,
                ['<bs>'] = file_browser_actions.backspace,
              },
              ['n'] = {
                ['c'] = file_browser_actions.create,
                ['r'] = file_browser_actions.rename,
                ['m'] = file_browser_actions.move,
                ['y'] = file_browser_actions.copy,
                ['d'] = file_browser_actions.remove,
                ['o'] = file_browser_actions.open,
                ['g'] = file_browser_actions.goto_parent_dir,
                ['e'] = file_browser_actions.goto_home_dir,
                ['w'] = file_browser_actions.goto_cwd,
                ['t'] = file_browser_actions.change_cwd,
                ['f'] = file_browser_actions.toggle_browser,
                ['h'] = file_browser_actions.toggle_hidden,
                ['s'] = file_browser_actions.toggle_all,
              },
            },
          },
        },
      })
      require('telescope').load_extension('file_browser')
    end,
  },
  { 'nvim-telescope/telescope-file-browser.nvim' },
}
