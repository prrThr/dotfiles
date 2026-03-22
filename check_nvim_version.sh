#!/bin/bash

NVIM_PATH="$HOME/AppImages/nvim-linux-x86_64.appimage"
APPIMAGES="$HOME/AppImages"

get_current_version() {
    "$NVIM_PATH" --version | head -n 1 | awk '{print $2}'
}

get_latest_version() {
    latest_version=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | \
        jq -r '.tag_name' | \
        grep -v 'nightly' | \
        grep -v 'test')

    echo "$latest_version"
}

download_latest_appimage() {
    latest_version="$1"
    download_url="https://github.com/neovim/neovim/releases/download/$latest_version/nvim-linux-x86_64.appimage"

    echo "Downloading Neovim $latest_version..."
    curl -L "$download_url" -o "$NVIM_PATH"
    chmod +x "$NVIM_PATH"
    echo "Neovim updated to $latest_version."
}

current_version=$(get_current_version)
latest_version=$(get_latest_version)

echo "Current Neovim version: $current_version"
echo "Latest stable Neovim version: $latest_version"

if [[ "$current_version" == "$latest_version" ]]; then
    echo "Neovim is up to date."
else
    echo "Neovim is outdated. Would you like to update to the latest version? (y/n)"

    read -rp "Enter choice: " user_choice
    if [[ "$user_choice" == "y" || "$user_choice" == "Y" ]]; then
        echo "Renaming the outdated Neovim to 'old_nvim-linux-x86_64.appimage'..."
        mv "$NVIM_PATH" "$APPIMAGES/old_nvim-linux-x86_64.appimage"
        download_latest_appimage "$latest_version"
    else
        echo "Skipping update."
    fi
fi

