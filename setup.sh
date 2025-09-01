#!/usr/bin/env bash
set -euo pipefail

install_homebrew() {
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "✓ Homebrew already installed"
    fi
}

install_packages() {
    local packages=(
        git stow raycast
        font-fira-code-nerd-font font-hack-nerd-font
        ripgrep bat fzf eza thefuck
        pyenv uv
    )
    
    echo "Installing packages..."
    for package in "${packages[@]}"; do
        if brew list "$package" &>/dev/null; then
            echo "✓ $package already installed"
        else
            echo "Installing $package..."
            brew install "$package"
        fi
    done
}

setup_dotfiles() {
    echo "Setting up git submodules..."
    git submodule update --init --recursive
    
    echo "Creating symlinks with stow..."
    stow -v .
}

main() {
    echo "Starting dotfiles setup..."
    cd ~/.dotfiles || { echo "Error: ~/.dotfiles not found"; exit 1; }
    
    install_homebrew
    install_packages
    setup_dotfiles
    
    echo "✓ Dotfiles setup complete!"
}

main "$@"
