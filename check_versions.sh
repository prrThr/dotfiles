#!/bin/bash

# fzf:
# em `~/.fzf` executar `git pull` e `./install`

# nvim:
# script em `~/check_nvim_version.sh`

# node e npm:
# `nvm install --lts`

# tldr:
# `source /opt/venv/bin/activate && pip install --upgrade tldr`

# Obsoleto:
# tldr: após atualizar o node, é necessário instalar novamento com `npm install -g tldr`. Se o tldr não tiver sido desinstalado, então resta apenas executar `npm update -g tldr`

compare_versions() {
    local INSTALLED="$1"
    local LATEST="$2"
    local PACKAGE="$3"

    if [ "$INSTALLED" == "$LATEST" ]; then
        echo -e "🟢 Up to date: $INSTALLED"
    else
        echo -e "🟡 Installed: $INSTALLED | Latest: $LATEST"
        read -rp "Deseja atualizar $PACKAGE? (s/n): " REPLY
        if [[ "$REPLY" =~ ^[Ss]$ ]]; then
            case "$PACKAGE" in
                "fzf")
                    echo "Atualizando fzf..."
                    (cd ~/.fzf && git pull && sleep 3 && ./install) || echo "[ERRO] Falha ao atualizar fzf."
                    ;;
                "Neovim")
                    echo "Atualizando Neovim..."
                    bash check_nvim_version.sh || echo "[ERRO] Falha ao atualizar Neovim."
                    ;;
                "Node"|"npm")
                    echo "Atualizando Node.js e npm (LTS)..."
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
                    nvm install --lts || echo "[ERRO] Falha ao atualizar Node.js/npm."
                    ;;
                "tldr")
                    echo "Atualizando tldr..."
                    source /opt/venv/bin/activate && pip install --upgrade tldr || echo "[ERRO] Falha ao atualizar tldr."
                    ;;
                *)
                    echo "[WARNING] Nenhum comando de atualização definido para $PACKAGE."
                    ;;
            esac
        else
            echo "Atualização de $PACKAGE ignorada."
        fi
    fi
}

echo "Checking versions..."

### fzf ###
if command -v fzf &>/dev/null; then
    INSTALLED_FZF=$(fzf --version | awk '{print $1}')
    LATEST_FZF=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/^v//')
    echo -e "\n📦 fzf:"
    compare_versions "$INSTALLED_FZF" "$LATEST_FZF" "fzf"
else
    echo -e "\n📦 fzf: 🔴 Not installed"
fi

### Neovim ###
if command -v nvim &>/dev/null; then
    INSTALLED_NVIM=$(nvim --version | head -n1 | awk '{print $2}' | sed 's/^v//')
    LATEST_NVIM=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep tag_name | cut -d '"' -f 4 | sed 's/^v//')
    echo -e "\n📦 Neovim:"
    compare_versions "$INSTALLED_NVIM" "$LATEST_NVIM" "Neovim"
else
    echo -e "\n📦 Neovim: 🔴 Not installed"
fi

### Node.js ###
if command -v node &>/dev/null; then
    INSTALLED_NODE=$(node -v | sed 's/v//')
    NODE_VERSIONS=$(curl -s https://nodejs.org/dist/index.json)
    #LATEST_NODE=$(echo "$NODE_VERSIONS" | jq -r '.[0].version' | sed 's/v//')
    LATEST_LTS=$(echo "$NODE_VERSIONS" | jq -r '[.[] | select(.lts != false)][0].version' | sed 's/v//')
    echo -e "\n📦 Node.js (LTS):"
    #echo -n "  Latest: $LATEST_NODE"
    #compare_versions "$INSTALLED_NODE" "$LATEST_NODE"
    #echo -n "  LTS:    "
    compare_versions "$INSTALLED_NODE" "$LATEST_LTS" "Node"
else
    echo -e "\n📦 Node.js: 🔴 Not installed"
fi

### npm ###
if command -v npm &>/dev/null; then
    INSTALLED_NPM=$(npm -v)
    LATEST_NPM=$(curl -s https://registry.npmjs.org/npm/latest | jq -r '.version')
    echo -e "\n📦 npm (LTS):"
    compare_versions "$INSTALLED_NPM" "$LATEST_NPM" "npm"
else
    echo -e "\n📦 npm: 🔴 Not installed"
fi

### tldr ###
if command -v tldr &>/dev/null; then
    #INSTALLED_TLDR=$(tldr --version 2>/dev/null | grep -oP 'v?\K[0-9.]+')
    INSTALLED_TLDR=$(tldr --version | awk '{print $2}')
    LATEST_TLDR=$(curl -s https://api.github.com/repos/tldr-pages/tldr-python-client/releases/latest | jq -r '.tag_name' | sed 's/^v//')
    echo -e "\n📦 tldr:"
    compare_versions "$INSTALLED_TLDR" "$LATEST_TLDR" "tldr"
else
    echo -e "\n📦 tldr: 🔴 Not installed"
fi

