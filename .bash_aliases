# Scripts
top_filter() {
    if [ -z "$1" ]; then
        echo "Parameter needed"
    else
        top -c -p $(pgrep -d',' -f "$1")
    fi
}

list_repos() {
    file=$(fzf -m --preview 'batcat --style=numbers --color=always --line-range :500 {}' --preview-window=bottom:60%:wrap < <(find /etc/apt/sources.list.d/ -type f))

    if [ -n "$file" ]; then
      batcat "$file"
    fi
}


# -----------------------------------------------------------------

# Aliases
alias bat='batcat'
alias firefox_profile='cd $HOME/.var/app/org.mozilla.firefox/.mozilla/firefox/7mub91qj.default-release/chrome'
alias vim='nvim'
alias todo='nvim ~/Desktop/todo.md'

# -----------------------------------------------------------------
# My prompt

GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
YELLOW='\[\033[01;33m\]'
RESET='\[\033[00m\]'


if [ -f /etc/bash_completion.d/git-prompt ]; then
    source /etc/bash_completion.d/git-prompt
fi

export GIT_PS1_SHOWDIRTYSTATE=1       # '*' modified '+' staged
export GIT_PS1_SHOWUNTRACKEDFILES=0   # '*' untracked
export GIT_PS1_STATESEPARATOR=''      # Remove space between indicators

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}['"$GREEN"'\u'"$RESET"'@'"$GREEN"'\h'"$RESET"' '"$BLUE"'\W'"$RESET"']'"$YELLOW"'$(__git_ps1 "(%s)")'"$RESET"'$ '
else
    PS1='${debian_chroot:+($debian_chroot)}[\u@\h \W]$(__git_ps1 " (%s)")$ '
fi

unset color_prompt force_color_prompt

# -----------------------------------------------------------------

# Neovim
# Caso usar via appimage
export PATH="$PATH:/opt/nvim/"

# Caso usar via package
# export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# -----------------------------------------------------------------

# npm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

# zoxide
eval "$(zoxide init bash)"

# OpenJDK
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

# Rust
. "$HOME/.cargo/env"

