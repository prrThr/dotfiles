
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH=~/.oh-my-zsh

# LOCALE
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_ALL=en_US.UTF-8 perl


# Liked themes (already installed)
# af-magic,af-magic2 (my customized theme), kennethreitz, kphoen, mortalscumbag, murilasso
ZSH_THEME="af-magic-no-right"

HIST_STAMPS="dd.mm.yyyy"

# Plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi


# My custom aliases and scripts
source ~/zsh_aliases.zsh

export VISUAL='nvim'
export EDITOR='nvim'

# Not working :(
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Node Version Manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init zsh)"

# fzf
source <(fzf --zsh)
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

# Scripts

top_filter() {
    if [ -z "$1" ]; then
        echo "Parameter needed"
    else
        top -c -p $(pgrep -d',' -f "$1")
    fi
}


if command -v tmux &>/dev/null && ! tmux has-session -t main 2>/dev/null; then
  tmux new-session -s main
fi

