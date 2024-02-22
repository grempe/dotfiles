#!/bin/bash

# This script will be run automatically by GitHub Codespaces and will initialize the container.

# Check if running on GitHub Codespaces
if [ "$CODESPACES" = "true" ]; then
    sudo apt update -y

    # Install eza
    sudo apt install -y gpg
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update -y
    sudo apt install -y eza

    # Install bat
    sudo apt install bat -y

    # Install fzf
    sudo apt install fzf -y

    # Install ripgrep
    sudo apt install ripgrep -y

    # Install zoxide
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

    # Install Starship (non-interactive)
    curl -sS https://starship.rs/install.sh | sh -s -- -y

    # Install and init dotfiles with chezmoi
    # see : https://www.chezmoi.io/quick-start/#using-chezmoi-across-multiple-machines
    sh -c "$(curl -fsLS get.chezmoi.io)"
    chezmoi init --apply --verbose https://github.com/grempe/dotfiles.git
fi
