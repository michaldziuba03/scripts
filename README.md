<p align="center">
  <img width="300" src="https://github.com/michaldziuba03/scripts/assets/43048524/98580b6a-57f2-4e1b-b61c-303cf3575756" />  
</p>

## Shell Scripts and setups
Scripts for my UNIX based machines. I try to make each script work on any major Linux distro.

### Some personal rules for writing scripts I try to apply
- use common programs to avoid additional dependencies
- try to make it POSIX compilant
- can be run from any place on your system - it shouldn't result with output files in your current directory

### Install Nerd Fonts
Nerd fonts are essential part of my every Linux setup. They are required by many fancy configs for shell or text editors. Script just install my favourite nerd fonts.
```sh
curl -o- https://raw.githubusercontent.com/michaldziuba03/scripts/main/install-fonts.sh | sh
```

### Install Neovim
Neovim is just Vim but better. I like to use Neovim for Rust programming, Shell scripting and editing configs on my system. I use this script only for distros with outdated neovim version in repository (Ubuntu, Debian). On Arch based distros I install neovim just with `pacman`.
```sh
curl -o- https://raw.githubusercontent.com/michaldziuba03/scripts/main/install-nvim.sh | sh
```

> Script installs neovim in `~/.local/bin` directory. Make sure $PATH contains this directory to make `nvim` executable from any place. You may need to logout your session. If `nvim` command still does not work edit `.profile`, append `PATH="$HOME/.local/bin:$PATH"` and logout.

### Install NvChad from official website
I don't really want to spend my time on mantaining own config for Neovim (I used to spend). Among many configs for neovim around - NvChad is my favourite.

1. Install Nerd fonts
2. Install Neovim
3. [Copy single command from official docs](https://nvchad.com/docs/quickstart/install)

> Make sure your terminal is configured to use Nerd Font.

### LICENSE
Distributed under the MIT License. See LICENSE for more information.

