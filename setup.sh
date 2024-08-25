#!/usr/bin/env bash
current_dir=$PWD
cd ~/.dotfiles

# Install programs
echo -e "\nInstalling Brew and programs..."
if ! command -v brew &> /dev/null
then
    sudo -u $SUDO_USER /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
  pyenv \
  ; do
  brew list $program &>/dev/null || brew install $program
done

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

echo -e "\nStowing apps for user: ${whoami}"
stow -v .
echo -e "\n##### ALL DONE"
cd $current_dir # Return to previous directory
