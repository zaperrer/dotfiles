#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Checking dotfiles health..."

# Change to dotfiles directory
cd ~/.dotfiles || { echo "❌ Error: ~/.dotfiles not found"; exit 1; }

# Check stow configuration
echo "📦 Checking stow configuration..."
if stow --simulate -v . >/dev/null 2>&1; then
    echo "✓ Stow configuration valid"
else
    echo "❌ Stow configuration has conflicts"
    stow --simulate -v . 2>&1 | head -10
    exit 1
fi

# Check Neovim configuration
echo "📝 Checking Neovim configuration..."
if command -v nvim >/dev/null 2>&1; then
    if nvim --headless -c "lua vim.health.check()" -c "qall" >/dev/null 2>&1; then
        echo "✓ Neovim configuration healthy"
    else
        echo "⚠️  Neovim may have configuration issues (run :checkhealth in nvim)"
    fi
else
    echo "⚠️  Neovim not installed"
fi

# Check tmux configuration
echo "🖥️  Checking tmux configuration..."
if command -v tmux >/dev/null 2>&1; then
    if tmux -f .config/tmux/tmux.conf list-sessions >/dev/null 2>&1 || [[ $? -eq 1 ]]; then
        echo "✓ tmux configuration syntax valid"
    else
        echo "❌ tmux configuration has syntax errors"
    fi
else
    echo "⚠️  tmux not installed"
fi

# Check git submodules
echo "📚 Checking git submodules..."
if git submodule status | grep -q "^-"; then
    echo "⚠️  Some submodules are not initialized"
    echo "   Run: git submodule update --init --recursive"
else
    echo "✓ All submodules initialized"
fi

# Check Brewfile
echo "🍺 Checking Brewfile..."
if command -v brew >/dev/null 2>&1; then
    if brew bundle check --file=Brewfile >/dev/null 2>&1; then
        echo "✓ All Brewfile dependencies satisfied"
    else
        echo "⚠️  Some Brewfile dependencies missing"
        echo "   Run: brew bundle --file=Brewfile"
    fi
else
    echo "⚠️  Homebrew not installed"
fi

echo ""
echo "✅ Health check complete!"