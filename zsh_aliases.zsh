### Settings ----------------------------------------------------------------------------

### Scripts ------------------------------------------------------------------------------

### Automations --------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------

### Aliases ------------------------------------------------------------------------------

scripts=~/Documents/terminalThings
edit=nvim
show=bat

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

# Open notes
alias notes="glow -p ~/Documents/Notes/notes.md"
# Edit notes
alias editNotes="nvim ~/Documents/Notes/notes.md"

# Close ranger on actual location
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

## ---- Configs
alias polybarconfig='cd ~/.config/polybar; nvim'

alias fac='cd ~/Faculdade/7semestre/; yazi'
