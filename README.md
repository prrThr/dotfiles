## Requirements

### System packages
```
sudo apt install git stow alacritty tmux bat glow htop
```

### Appimages
- [Obsidian](https://obsidian.md/download)
- [Neovim](https://github.com/neovim/neovim/releases)

### Flatpaks
- Discord `com.discordapp.Discord`
- OBS `com.obsproject.Studio`
- Firefox `org.mozilla.firefox`

### Others
- [Jetbrains Toolbox](https://www.jetbrains.com/toolbox-app/) (.tar.gz)
- [Zoxide](https://github.com/ajeetdsouza/zoxide) (script)
- [Node/npm](https://nodejs.org/en/download) (script)
- [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#installation) (git clone)
- [tldr](https://tldr.sh/) (npm)

## Installation

First, clone the dotfiles repository to the $HOME directory using git
```
$ git clone git@github.com:prrThr/dotfiles.git
$ cd dotfiles
$ git branch mint
```

then, use GNU stow inside the `~/dotfiles` directory to create symlinks
```
$ stow .
```

