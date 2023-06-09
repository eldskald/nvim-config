# nvim-config

This is just a repository with my neovim configuration to make my life easier when using it in multiple machines.

# Installation

You need [neovim](https://github.com/neovim/neovim) v0.9.0 first. Lastly, just clone this repository at ~/.config/nvim :

```
git clone https://github.com/eldskald/nvim-config.git ~/.config/nvim
```

## Dependencies

You need [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope to work. You would also need [nnn](https://github.com/jarun/nnn) and [tmux](https://github.com/tmux/tmux) for the file tree with the previews to work, but you would need to setup the previews on nnn yourself, with the plugins. Follow [these](https://github.com/jarun/nnn/tree/master/plugins#installation) instructions to do this.

# Setting up neovim with Godot

## Setting up neovim to listen to Godot's LSP

You don't need to download any LSP on Mason, just open up Godot if you're running these configs as is. __Godot's LSP runs on the editor, so it's only open while the editor is open.__ Lastly, check where the LSP's port actually is: go to Editor > Editor Settings > Network. There you can see the port. These settings as is will be listening for 6005, but 3.x latest branches are 6008 by default, so change it to 6005.

If you want help getting it to work on your own configs, you need to at least have nvim-lspconfig installed. You'll need to add a `gdscript.lua` file on `after/ftplugin` and `after/ftdetect` with the following lines:

```lua
-- on after/ftdetect/gdscript.lua:
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.gd',
  command = 'set ft=gdscript',
})
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.gd',
  command = 'set ft=gdscript',
})

-- on after/ftplugin/gdscript.lua:
require('lspconfig').gdscript.setup({})
```

You should put indenting and other properties on `after/ftplugin/gdscript.lua` as well, as its good practice. You can take a look at my file to see my settings.

## Using neovim as an external code editor for Godot

You can have it so whenever you double click a script in Godot, it opens it in neovim instead of Godot's built in code editor.

First, you need to open neovim with a setup server. To do so, run the following:

```
nvim --listen <your server path>
```

The path can be anywhere, it's temporary. I set it on `~/.cache/nvim/server`.

Now, open up Godot, go to Editor > Editor Settings > Text Editor > External, tick Use External Editor, put `nvim` on Exec Path and `--server <your server path> --remote-send "<C-\><C-N>:n {file}<CR>:call cursor({line},{col})<CR>"` on Exec Flags. You can't put `~` there, you must put the whole path. Now, whenever you have a neovim instance with that server, when you double click a .gd file it will open on that instance on a new tab.

If you try to open it without a neovim instance with that server, it'll make a swap file on `~/.local/state/nvim/swap/` to warn you some other neovim instance might be editing that file, so the next time you try to open that file it will complain about that swap file. Just delete that file if you want it to stop complaining.

