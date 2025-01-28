home=$HOME
### Settings ----------------------------------------------------------------------------

### Scripts ------------------------------------------------------------------------------
# Change KDE theme
alias toDark=$home/Scripts/change_theme/./toDark.sh
alias toLight=$home/Scripts/change_theme/./toLight.sh

### Automations --------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------

### Aliases ------------------------------------------------------------------------------

scripts=~/Documents/terminalThings
edit=nvim

#show=bat
show="glow -p"

# Copy actual path to clipboard
alias cpPwd="pwd | xclip -selection clipboard"

# Essentials terminal commands
alias '?'="$show $scripts/usefulCommands.md"
alias edit'?'="$edit $scripts/usefulCommands.md"

# Essentials docker commands
alias docker'?'="$show $scripts/dockerCommands.md"

# Essentials SSH commands
alias ssh'?'="$show $scripts/sshCommands.md"

# Show wifi info
alias wifi'?'="$scripts/wifiInfos.sh"

# Show essentials vim commands
alias vimCommands'?'="$show $scripts/vimCommands.md"

# Show Ranger commands
alias ranger'?'="$show $scripts/rangerCommands.md"

# Vaguitas emprego pls
alias contasVagas="$show ~/Documents/Work/ContasVagas.md"
alias adicionarVaga="$edit ~/Documents/Work/ContasVagas.md"

# Show how chmod works
alias chmod'?'="$show ~/Documents/Notes/chmod.md"

# Open notes | -p returning broken format
alias notes="$show ~/Documents/Notes/notes.md"
# Edit notes
alias editNotes="nvim ~/Documents/Notes/notes.md"

# Close ranger on actual location
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias desktop1='cd $home/.local/share/applications'
alias desktop2='cd /usr/share/applications'
alias desktop3='cd /var/lib/flatpak/exports/share/applications'

alias firefox_profile='cd $home/.mozilla/firefox/3epnso9j.default-release/chrome'
alias thunderbird_profile='cd $home/.thunderbird/pnb4jl36.default-esr'
alias qbit_settings='cd $home//.var/app/org.qbittorrent.qBittorrent/data/qBittorrent'

alias trs='cd $home/Torrents; yazi'

alias nvimcfg='cd ~/.config/nvim; nvim'
alias yazicfg='cd ~/.config/yazi; nvim'

alias play_movie='~/Scripts/play_video_with_sub.sh'

# alias inútil, só apertar gc -> c
# alias ydf='cd $home/.config/; yazi'

## ---- Configs




