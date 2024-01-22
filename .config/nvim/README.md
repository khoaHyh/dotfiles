# Neovim config

Mostly using neovim these days as a commandline editor but every now and then I like to use it as a
secondary driver when developing. I've been plugin-happy but have also tried to keep it sane without
too much bloat. I think my goal atm is to trim as much fast as possible so that I don't have to debug
my config every month :-(. 

### Installation

If you would like to use this neovim set up here are some steps. Only Linux/macOS compatible btw but
Windows steps shouldn't be too different.

Install `neovim`: [guide](https://github.com/neovim/neovim/blob/master/INSTALL.md)

Port my config (the entire `nvim` directory here) to the path `$HOME/.config`.

**Optional** 

If you have your own dotfiles directory and would like to maintain a copy of your config while
also using it you can use a sym link.

```sh
ln -s /path/to/target_directory /path/to/symlink_directory

-- Example: here the original directory lives at ~/dev/dotfiles/.config/nvim and we are
-- creating a symbolic link at the path ~/.config/nvim
ln -s ~/dev/dotfiles/.config/nvim ~/.config/nvim
```

### TODOS

* Add and setup lsp, linter, formatter, autocomplete and autosuggestions
    * would like this for: golang, javascript, typescript, tsx, css, lua, c, yaml

