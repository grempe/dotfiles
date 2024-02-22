#!/bin/bash

# This script will be run automatically by GitHub Codespaces and will initialize the container.

# Check if running on GitHub Codespaces
if [ "$CODESPACES" = "true" ]; then
    # Install and init dotfiles with chezmoi
    # see : https://www.chezmoi.io/quick-start/#using-chezmoi-across-multiple-machines
    sh -c "$(curl -fsLS get.chezmoi.io)"
    chezmoi init --apply --verbose https://github.com/grempe/dotfiles.git
fi
