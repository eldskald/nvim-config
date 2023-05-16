# nvim-config

This is just a repository with my neovim configuration to make my life easier when using it in multiple machines.

# Installation

You need [neovim](https://github.com/neovim/neovim) v0.9.0 first. Then, you need [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope to work. Lastly, just clone this repository at ~/.config/nvim :

```
git clone https://github.com/eldskald/nvim-config.git ~/.config/nvim
```

# Setting up neovim with Godot

## Setting up neovim to listen to Godot's LSP

You don't need to download any LSP on Mason, just open up Godot if you're running these configs as is. __Godot's LSP runs on the editor, so it's only open while the editor is open.__ Lastly, check where the LSP's port actually is: go to Editor > Editor Settings > Network. There you can see the port. These settings as is will be listening for 6005, but 3.x latest branches are 6008 by default, so change it to 6005.

If you want help getting it to work on your own configs, try adding the following code after you setup nvim-lspconfig and cmp_nvim_lsp:

```
local cmp = require('cmp_nvim_lsp')
local lspprot = vim.lsp.protocol
require('lspconfig').gdscript.setup({
  capabilities = cmp.default_capabilities(lspprot.make_client_capabilities()),
})
```

I put these on after/ftplugin/gdscript.lua, since I only want these to run if I'm editing gdscript files. [This](https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/gdscript.lua) is their official setup for GDScript. Notice it's listening to 6005 or an environment variable by default, so another way to set it is to set that environment variable instead of changing the LSP's port on the editor settings.

## Using neovim as an external code editor for Godot

You can have it so whenever you double click a script in Godot, it opens it in neovim instead of Godot's built in code editor.

First, you need to open neovim with a setup server. To do so, run the following:

```
nvim --listen <your server path>
```

The path can be anywhere, it's temporary. I set it on `~/.cache/nvim/server`.

Now, open up Godot, go to Editor > Editor Settings > Text Editor > External, tick Use External Editor, put `nvim` on Exec Path and `--server <your server path> --remote-silent {file}` on Exec Flags. You can't put `~` there, you must put the whole path. Now, whenever you have a neovim instance with that server, when you double click a .gd file it will open on that instance on a new tab.

If you try to open it without a neovim instance with that server, it'll make a swap file on `~/.local/state/nvim/swap/` to warn you some other neovim instance might be editing that file, so the next time you try to open that file it will complain about that swap file. Just delete that file if you want it to stop complaining.

# Recommendations

## ripgrep

You already have it installed for telescope to work, so just use it on your workflow. It greps your system for anything you want to find, that's pretty much telescope on your whole system, even outside neovim. For example:

```
cd ~/.config/nvim/
rg -F "require('lspconfig')"
```

This will print all files that include `require('lspconfig')` on your nvim config files and the lines with it. This is really useful for refactoring. It only searches recursively on the folder you call it at, and it will ignore everthing under .git, .gitignore, hidden files and among other things. You can add more filters, for example:

```
rg -F "require('lspconfig')" -g "*.md"
```

This searches for occurrences of `require('lspconfig')` on files that match the `*.md` glob, recursively on the current directory. It also supports config files so you can remove some of the filter it automatically applies, such as hidden files. Read more at [their documentation](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md).

## nvim --remote

Even if you don't use Godot, I recommend learning the neovim remote commands. Whenever you have an instance of neovim listening to a server, you can do stuff to that instance from other terminals, applications, you name it. For example, if you run

```
nvim --server <server path> --remote-silent <file path>
```

you will open that file on a new tab on that neovim instance. You can send key presses too.

```
nvim --server <server path> --remote-send ":echo 'running this command remotely'<CR>"
```

This will cause all these keys to be typed, so from normal mode you would echo `running this command remotely` and from insert mode you would insert `:echo 'running this command remotely'` and then a line break.

You can use it to automate stuff or to use neovim as external editor for other software other than Godot. Read more [here](https://neovim.io/doc/user/remote.html).

