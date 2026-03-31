#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Setting up OpenCode dotfiles..."

mkdir -p ~/.config/opencode
mkdir -p ~/.npm-global

ln -sf "$DOTFILES_DIR/opencode/opencode.json" ~/.config/opencode/opencode.json
echo "✅ Linked opencode.json"

if [ -d "$DOTFILES_DIR/skills" ] && [ "$(ls -A $DOTFILES_DIR/skills)" ]; then
    mkdir -p ~/.opencode/skills
    cp -r "$DOTFILES_DIR/skills/"* ~/.opencode/skills/ 2>/dev/null || true
    echo "✅ Linked skills"
fi

if ! grep -q ".npm-global/bin" ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
    echo "✅ Added npm-global to PATH"
fi

echo ""
echo "📦 Installing npm packages..."
npm install -g oh-my-opencode opencode-scheduler opencode-pty @hung319/opencode-hive browser-use-cli 2>/dev/null || true
echo "✅ Installed npm packages"

echo ""
echo "✨ Setup complete! Restart your terminal."
