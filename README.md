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

## KDE things

### Konsole
Konsole themes are located in .local/share/konsole
More information in the [GitHub repository](https://github.com/catppuccin/konsole)
After executing `stow .` do the next:
1. Reload Konsole
2. Navigate to `Settings > Manage Profiles` then click **New**
3. Check Default Profile 
4. Open the **Appearence** tab and select one of the themes
5. Click **Apply** then **OK**

### Yakuake
Folow the steps on the [GitHub repository](https://github.com/catppuccin/yakuake)

