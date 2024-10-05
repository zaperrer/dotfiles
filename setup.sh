#!/usr/bin/env bash
mkdir -p ~/.dotfiles
cd ~/.dotfiles || exit

if ! command -v brew &>/dev/null; then
    sudo -u "$SUDO_USER" /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

for program in \
    git \
    stow \
    raycast \
    font-fira-code-nerd-font \
    font-hack-nerd-font \
    ripgrep \
    thefuck \
    bat \
    fzf \
    eza \
    pyenv; do
    brew list $program &>/dev/null || brew install $program
done

git submodule init
git submodule update

stow -v .
cd ~ || exit
