# Dotfiles

Personal dotfiles managed with GNU Stow for macOS development environment.

## Features

- **Neovim**: LazyVim-based configuration with AI tools (Copilot, Claude Code)
- **tmux**: Session management with catppuccin theme and vim navigation
- **Zsh**: Zinit plugin manager with starship prompt and modern CLI tools
- **Automated setup**: Homebrew dependencies and symlink management

## Quick Start

```bash
git clone <repo-url> ~/.dotfiles
~/.dotfiles/setup.sh
```

## Health Check

```bash
~/.dotfiles/scripts/health-check.sh
```

## Structure

- `.config/` - Application configurations (nvim, tmux)
- `.zshrc` - Zsh shell configuration
- `Brewfile` - Homebrew dependencies
- `setup.sh` - Installation script (can run from anywhere)
- `scripts/` - Utility scripts
