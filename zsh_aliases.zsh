## TODO
# Falta corrigir o diretório de anotações

### Settings ----------------------------------------------------------------------------
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

### Scripts ------------------------------------------------------------------------------

# Change KDE theme
alias toDark=$HOME/Scripts/change_theme/./toDark.sh
alias toLight=$HOME/Scripts/change_theme/./toLight.sh

# LAN server
alias run_server="~/Scripts/private_server.sh"

#-----------------------------------------------------------------------------------------

### Aliases ------------------------------------------------------------------------------

scripts=~/Documents/terminalThings
edit=nvim
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

# Vaguitas emprego pls
alias contasVagas="bat ~/Documents/Work/ContasVagas.md"
alias adicionarVaga="$edit ~/Documents/Work/ContasVagas.md"

# Show how chmod works
alias chmod'?'="$show ~/Documents/Notes/chmod.md"

# Open notes | -p returning broken format
alias notes="$show ~/Documents/Notes/notes.md"
# Edit notes
alias editNotes="nvim ~/Documents/Notes/notes.md"

alias desktop1='cd $HOME/.local/share/applications'
alias desktop2='cd /usr/share/applications'
alias desktop3='cd /var/lib/flatpak/exports/share/applications'

alias firefox_profile='cd $HOME/.mozilla/firefox/3epnso9j.default-release/chrome'
alias thunderbird_profile='cd $HOME/.thunderbird/pnb4jl36.default-esr'
alias qbit_settings='cd $HOME/.var/app/org.qbittorrent.qBittorrent/data/qBittorrent'

alias play_movie='~/Scripts/play_video_with_sub.sh'
alias vim='nvim'
alias ddf='df -h | head -1 ; df -h | grep "/dev/"'
alias todo='vim ~/Desktop/todo.md'
alias script='$HOME/Scripts/run_script.sh'
alias check_hashes='$HOME/Scripts/check_hashes.sh'


