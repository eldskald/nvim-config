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
}
