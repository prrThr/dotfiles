### Settings ----------------------------------------------------------------------------

export VISUAL=vim
export EDITOR=vim

### Scripts ----------------------------------------------------------------------------

# Função para alterar o perfil do gnome-terminal com base no tema do sistema

change_terminal_profile() {
    local system_theme
    system_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

    case "$system_theme" in
        "'Yaru'")
            # Altera o perfil para '2f2884e5-e2dd-491a-8747-218457e1297d'
            dconf write /org/gnome/terminal/legacy/profiles:/default "'2f2884e5-e2dd-491a-8747-218457e1297d'"
            ;;
        "'Yaru-dark'")
            # Altera o perfil para 'fb358fc9-49ea-4252-ad34-1d25c649e633'
            dconf write /org/gnome/terminal/legacy/profiles:/default "'fb358fc9-49ea-4252-ad34-1d25c649e633'"
            ;;
        *)
            echo "Tema do sistema desconhecido: $system_theme"
            ;;
    esac
}


# Change MySQL-Workbench theme 

changeWorkbenchTheme() {
    local system_theme
    system_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

    case "$system_theme" in
        "'Yaru'")
	    sudo cp ~/GitClones/mysql-workbench-themes/default.xml /usr/share/mysql-workbench/data/code_editor.xml
            ;;
        "'Yaru-dark'")
            sudo cp ~/GitClones/mysql-workbench-themes/darktheme.xml /usr/share/mysql-workbench/data/code_editor.xml
            ;;
        *)
            echo "Tema do sistema desconhecido: $system_theme"
            ;;
    esac
}

### Automations -----------------------------------------------------------------------

change_kitty_theme() {
    kitty_theme_dir="$HOME/.config/kitty/kitty-themes/themes"
    kitty_config_dir="$HOME/.config/kitty"
    local system_theme
    system_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

    case "$system_theme" in
        "'Yaru'")
            cp "$kitty_theme_dir/CLRS.conf" "$kitty_config_dir/theme.conf"
            ;;
        "'Yaru-dark'")
            cp "$kitty_theme_dir/snazzy.conf" "$kitty_config_dir/theme.conf"
            ;;
        *)
            echo "Tema do sistema desconhecido: $system_theme"
            ;;
    esac
}


#-----------------------------------------------------------------------------------------

# Verifica e ajusta o tema do terminal kitty de acordo com o tema do sistema
#change_kitty_theme

# Verifica e ajusta o perfil do gnome-terminal de acordo com o tema do sistema
if [[ -n "$ZSH_VERSION" ]]; then
    change_terminal_profile
fi

### Aliases ----------------------------------------------------------------------------

scriptsPath=~/Documents/terminalThings

# Copy actual path to clipboard
alias cpPwd="pwd | xclip -selection clipboard"


# Essentials terminal commands
alias '?'="mdless -P $scriptsPath/usefulCommands.md"
alias edit'?'="vim $scriptsPath/usefulCommands.md"


# Essentials docker commands
alias docker'?'="mdless -P $scriptsPath/dockerCommands.md"

# Essentials SSH commands
alias ssh'?'="mdless -P $scriptsPath/sshCommands.md"

# Show wifi info
alias wifi'?'="$scriptsPath/wifiInfos.sh"


# Show essentials vim commands
alias vim'?'="mdless -P $scriptsPath/vimCommands.md"

# Show Ranger commands
alias ranger'?'="mdless -P $scriptsPath/rangerCommands.md"

# Vaguitas emprego pls
alias contasVagas="mdless -P ~/Documents/Work/ContasVagas.md"
alias adicionarVaga="vim ~/Documents/Work/ContasVagas.md"


# Alterar tema do MySQl Workbench
alias sqlTheme=changeWorkbenchTheme
