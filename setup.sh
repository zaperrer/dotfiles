#!/usr/bin/env bash
current_dir=$PWD
cd ~/.dotfiles

# Install programs
if ! command -v brew &> /dev/null
then
    echo "Installing Brew and programs..."
    sudo -u $SUDO_USER /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install --cask raycast
    brew tap homebrew/cask-fonts
    brew install font-fira-code-nerd-font
    brew install font-hack-nerd-font
    brew install ripgrep
    brew install zoxide
    brew install bat
    brew install fzf
    brew install eza
    brew install pyenv
    brew install git
    brew install stow
fi

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

echo ""
echo "Stowing apps for user: ${whoami}"
stow -v .
echo ""
echo "##### ALL DONE"
cd $current_dir # Return to previous directory

echo "Remember to install Warp"
