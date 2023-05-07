return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    config = function()
      local map = vim.keymap
      map.set("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
      map.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
      map.set("n", "<leader>fg", "<cmd> Telescope live_grep <CR>")
      map.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>")
      map.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>")
      map.set("n", "<leader>fb", "<cmd> Telescope file_browser <CR>")

      local fb_actions = require("telescope._extensions.file_browser.actions")
      require("telescope").setup({
        extensions = {
          file_browser = {
            mappings = {
              ["n"] = {
                ["c"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["m"] = fb_actions.move,
                ["y"] = fb_actions.copy,
                ["d"] = fb_actions.remove,
                ["o"] = fb_actions.open,
                ["g"] = fb_actions.goto_parent_dir,
                ["e"] = fb_actions.goto_home_dir,
                ["w"] = fb_actions.goto_cwd,
                ["t"] = fb_actions.change_cwd,
                ["f"] = fb_actions.toggle_browser,
                ["h"] = fb_actions.toggle_hidden,
                ["s"] = fb_actions.toggle_all,
              },
            },
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
  },
  {"nvim-telescope/telescope-file-browser.nvim"},
}
