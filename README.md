# nvim-config

This is just a repository with my neovim configuration to make my life easier when using it in multiple machines.

## Installation

You need [neovim](https://github.com/neovim/neovim) v0.9.0 first. Then, you need [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope to work. Lastly, just clone this repository at ~/.config/nvim :

```
git clone https://github.com/eldskald/nvim-config.git ~/.config/nvim
```

## Recommendations

### neovim-remote

You need [neovim-remote](https://github.com/mhinz/neovim-remote) to use neovim as a default code editor for Godot. To do so, go to Godot, Editor > Editor Settings > Text Editor > External, tick Use External Editor, put `nvr` on Exec Path and `-s --remote-send "<C-\><C-N>:n {file}<CR>:call cursor({line},{col})<CR>" --nostart` on Exec Flags. Now, if you have a terminal running an instance of neovim listening to nvr's default socket, just open neovim with nvr if you're in doubt. I have an alias setting nvim and vim to `nvr -l -s`, so that everytime I call either vim or nvim at any file, it will open that file on the already running instance I have with neovim or open an instance listening to the right socket so that it's correctly setup. Use nvr, it's amazing for creating integrated development environments for everything, you can execute commands from a different terminal on you current running neovim instance, open files on buffers, it's really good not only for Godot but for all projects. Read more at [their repository](https://github.com/mhinz/neovim-remote).

### ripgrep

You already have it installed for telescope to work, so just use it on your workflow. It greps your system for anything you want to find. For example:

```
cd ~/.config/nvim/
rg -F "require('lspconfig')"
```

This will print all files that include `require('lspconfig')` on your nvim config files and the lines with it. This is really useful for refactoring. It only searches recursively on the folder you call it at, and it will ignore everthing under .git, .gitignore, hidden files and among other things. You can add more filters, for example:

```
rg -F "require('lspconfig')" -g "*.md"
```

This searches for occurrences of `require('lspconfig')` on files that match the `*.md` glob, recursively on the current directory. It also supports config files so you can remove some of the filter it automatically applies, such as hidden files. Read more at [their documentation](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md).

