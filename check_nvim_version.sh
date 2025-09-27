#!/bin/bash

NVIM_BIN="/opt/nvim/nvim"

if [[ ! -x "$NVIM_BIN" ]]; then
  echo "❌ Neovim não encontrado em $NVIM_BIN"
  exit 1
fi

INSTALLED_VERSION=$("$NVIM_BIN" --version | head -n 1 | grep -oP 'v\d+\.\d+\.\d+')
echo "📦 Versão instalada do Neovim: $INSTALLED_VERSION"

LATEST_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim/releases |
  jq -r '[.[] | select(.prerelease == false and .draft == false)][0].tag_name')

echo "🌐 Última versão estável disponível: $LATEST_VERSION"

if [[ "$INSTALLED_VERSION" == "$LATEST_VERSION" ]]; then
  echo "✅ Você já está usando a versão mais recente do Neovim."
  exit 0
else
  echo "🔄 Há uma nova versão disponível do Neovim."
  read -p "Deseja baixar e substituir a versão atual por $LATEST_VERSION? (s/N): " confirm
  if [[ "$confirm" =~ ^[sS]$ ]]; then
    echo "⬇️ Baixando Neovim $LATEST_VERSION..."

    TMP_FILE=$(mktemp)
    curl -L "https://github.com/neovim/neovim/releases/download/${LATEST_VERSION}/nvim.appimage" -o "$TMP_FILE"
    chmod +x "$TMP_FILE"
    
    echo "📁 Substituindo $NVIM_BIN com a nova versão..."
    sudo mv "$TMP_FILE" "$NVIM_BIN"
    
    echo "✅ Atualização concluída."
  else
    echo "🚫 Atualização cancelada."
  fi
fi

