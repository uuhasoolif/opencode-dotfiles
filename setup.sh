#!/bin/bash
# OpenCode Dotfiles Setup Script

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Setting up OpenCode dotfiles..."

# Create directories
mkdir -p ~/.config/opencode
mkdir -p ~/.npm-global

# Link OpenCode config
ln -sf "$DOTFILES_DIR/opencode/opencode.json" ~/.config/opencode/opencode.json
echo "✅ Linked opencode.json"

# Link npm-global
ln -sf "$DOTFILES_DIR/npm-global" ~/.npm-global
echo "✅ Linked npm-global"

# Link skills
if [ -d "$DOTFILES_DIR/skills" ] && [ "$(ls -A $DOTFILES_DIR/skills)" ]; then
    mkdir -p ~/.opencode/skills
    cp -r "$DOTFILES_DIR/skills/"* ~/.opencode/skills/ 2>/dev/null || true
    echo "✅ Linked skills"
fi

# Export PATH for npm-global
if ! grep -q ".npm-global/bin" ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
    echo "✅ Added npm-global to PATH"
fi

echo ""
echo "✨ Setup complete! Please restart your terminal."
