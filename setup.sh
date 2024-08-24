#!/usr/bin/env bash
current_dir=$PWD
cd ~/.dotfiles

# Install programs
echo -e "\nInstalling Brew and programs..."
if ! command -v brew &> /dev/null
then
    sudo -u $SUDO_USER /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install git
brew install stow
brew install --cask raycast
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
brew install font-hack-nerd-font
brew install ripgrep
brew install thefuck
brew install bat
brew install fzf
brew install eza
brew install pyenv

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

echo -e "\nStowing apps for user: ${whoami}"
stow -v .
echo -e "\n##### ALL DONE"
cd $current_dir # Return to previous directory
