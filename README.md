
This directory contains the dotfiles for my system running OpenSUSE Tumbleweed

## Requirements

### Git
```
sudo zypper in git
```

### Stow
```
sudo zypper in stow
```

## Installation

First, clone the dotfiles repository to the $HOME directory using git
```
$ git clone git@github.com:prrThr/dotfiles.git
$ cd dotfiles
```

then, use GNU stow inside the `~/dotfiles` directory to create symlinks
```
$ stow .
```
