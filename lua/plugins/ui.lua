return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    config = function()
      require('bufferline').setup({
        options = {
          indicator = { style = 'underline' },
          buffer_close_icon = '',
          close_icon = '',
          modified_icon = '*',
        },
      })
    end,
  },
  {
    {
      'goolord/alpha-nvim',
      config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        local v = vim.version()
        local dashboard_art = {
          [[                                                   ]],
          [[                                              ___  ]],
          [[                                           ,o88888 ]],
          [[                                        ,o8888888' ]],
          [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
          [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
          [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
          [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
          [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
          [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
          [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
          [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
          [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
          [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
          [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
          [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
          [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
          [[     ...:.'.:.::::"'    . . . . .'                 ]],
          [[    .. . ....:."' `   .  . . ''                    ]],
          [[  . . . ...."'                                     ]],
          [[  .. . ."'                                         ]],
          [[ .                                                 ]],
          [[                                                   ]],
        }
        local nvim_version = v.major .. '.' .. v.minor .. '.' .. v.patch
        local spaces_total = (string.len(dashboard_art[1]) - 13) / 2
        local nvim_centralized = string.rep(' ', spaces_total)
          .. 'NEOVIM v'
          .. nvim_version
        table.insert(dashboard_art, nvim_centralized)
        dashboard.section.header.val = dashboard_art
        dashboard.section.buttons.val = {
          dashboard.button('e', 'New file', ':ene <BAR> startinsert <CR>'),
          dashboard.button('f', 'Find file', ':Telescope find_files <CR>'),
          dashboard.button('q', 'Quit NVIM', ':qa<CR>'),
        }
        alpha.setup(dashboard.config)
      end,
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      -- Modified Eviline config for lualine,
      -- original by shadmansaleh and glepnir,
      -- modded by eldskald
      local lualine = require('lualine')

      -- stylua: ignore
      local colors = {
        bg       = '#202328',
        fg       = '#bbc2cf',
        yellow   = '#ECBE7B',
        cyan     = '#008080',
        darkblue = '#081633',
        green    = '#98be65',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#51afef',
        red      = '#ec5f67',
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand('%:p:h')
          local gitdir = vim.fn.finddir('.git', filepath .. ';')
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local config = {
        options = {
          component_separators = '',
          section_separators = '',
          theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x at right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left({
        function()
          return '▊'
        end,
        color = { fg = colors.blue }, -- Sets highlighting of component
        padding = { left = 0, right = 1 }, -- We don't need space before this
      })

      ins_left({
        'branch',
        icons_enabled = false,
        color = { fg = colors.magenta, gui = 'bold' },
      })

      ins_left({
        function()
          return '|'
        end,
      })

      ins_left({
        'filename',
        cond = conditions.buffer_not_empty,
        color = { fg = colors.orange, gui = 'bold' },
      })

      ins_left({
        function()
          return '|'
        end,
        cond = conditions.buffer_not_empty,
      })

      ins_left({
        'diff',
        symbols = { added = '+ ', modified = 'M ', removed = '- ' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      })

      ins_left({
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = 'X ', warn = '! ', info = 'i ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      })

      -- Insert mid section. You can make any number of sections in neovim :)
      -- for lualine it's any number greater then 2
      ins_left({
        function()
          return '%='
        end,
      })

      -- Add components to right sections
      ins_right({
        'filetype',
        icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
        color = { fg = colors.green, gui = 'bold' },
      })

      ins_right({
        function()
          return '|'
        end,
      })

      ins_right({ 'location' })

      ins_right({
        function()
          return '|'
        end,
      })

      ins_right({ 'progress', color = { fg = colors.fg, gui = 'bold' } })

      ins_right({
        function()
          return '▊'
        end,
        color = { fg = colors.blue },
        padding = { left = 1 },
      })

      -- Now don't forget to initialize lualine
      lualine.setup(config)
    end,
  },
}
