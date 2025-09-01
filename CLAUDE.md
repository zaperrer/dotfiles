# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository using GNU Stow for symlink management. The repository manages configuration files for Neovim and tmux, with a modular plugin-based architecture.

## Setup and Installation

- **Initial setup**: Run `./setup.sh` to install dependencies via Homebrew and set up the environment
- **Stow symlinks**: The setup script runs `stow -v .` to create symlinks from this repository to the home directory
- **Git submodules**: tmux plugins are managed as git submodules, initialized and updated during setup

## Architecture

### Stow Configuration
- Uses `.stow-local-ignore` to exclude setup files, README, and .git from symlinking
- Creates symlinks for `.config/` directory structure in the user's home directory

### Neovim Configuration
- **Entry point**: `.config/nvim/init.lua` → loads `config.lazy`  
- **Plugin manager**: Uses LazyVim with Lazy.nvim plugin manager
- **Structure**:
  - `lua/config/`: Core configuration (lazy.lua, options.lua, keymaps.lua)
  - `lua/plugins/`: Individual plugin configurations
- **Base**: Extends LazyVim distribution with custom plugins

### tmux Configuration
- **Entry point**: `.config/tmux/tmux.conf`
- **Plugin manager**: Uses TPM (Tmux Plugin Manager) with auto-installation
- **Key features**:
  - Prefix remapped to `C-Space`
  - Vi mode keybindings
  - Session management via tmux-sessionx (bound to `prefix + o`)
  - Catppuccin mocha theme
  - Session persistence via tmux-resurrect/continuum

## Dependencies

The setup script installs these via Homebrew:
- git, stow (core functionality)
- raycast (launcher)
- Nerd fonts (fira-code, hack)
- CLI tools: ripgrep, bat, fzf, eza, thefuck
- pyenv (Python version management)
- uv (Python package installer)

## File Management

- Use `stow -v .` to apply configuration changes
- Use `stow -D .` to remove symlinks
- tmux plugins are git submodules in `.config/tmux/plugins/`
- Neovim plugins are managed by Lazy.nvim in `~/.local/share/nvim/`