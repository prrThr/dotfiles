#!/bin/bash

# Verifica se o diretório .dotfiles existe
if [ ! -d ~/.dotfiles ]; then
  echo "O diretório ~/.dotfiles não foi encontrado. Certifique-se de que seu repositório de configuração dotfiles está em ~/.dotfiles."
  exit 1
fi

# Cria links simbólicos para os arquivos de configuração
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# Verifica se o diretório ~/.config/ranger existe
if [ ! -d ~/.config/ranger ]; then
  mkdir -p ~/.config/ranger
fi

ln -s ~/.dotfiles/ranger ~/.config/ranger

echo "Links simbólicos criados com sucesso."

