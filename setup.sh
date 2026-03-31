#!/bin/bash

# OpenCode Dotfiles Setup Script
# 自动同步 OpenCode 配置到新电脑

set -e

echo "========================================"
echo "OpenCode 配置同步脚本"
echo "========================================"

# 检测操作系统
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    CONFIG_DIR="$HOME/Library/Application Support/opencode"
    AGENTS_DIR="$HOME/Library/Application Support/opencode/agents"
    SKILLS_DIR="$HOME/.config/opencode/skills"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    OS="windows"
    CONFIG_DIR="$HOME/AppData/Roaming/opencode"
    AGENTS_DIR="$HOME/AppData/Local/opencode/agents"
    SKILLS_DIR="$HOME/.config/opencode/skills"
else
    OS="linux"
    CONFIG_DIR="$HOME/.config/opencode"
    AGENTS_DIR="$HOME/.local/share/opencode/agents"
    SKILLS_DIR="$HOME/.config/opencode/skills"
fi

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "检测到系统: $OS"
echo "配置目录: $CONFIG_DIR"
echo ""

# 1. 复制 opencode.json
echo "[1/5] 复制 opencode.json..."
mkdir -p "$CONFIG_DIR"
cp "$DOTFILES_DIR/opencode.json" "$CONFIG_DIR/"

# 2. 复制 package.json
echo "[2/5] 复制 package.json..."
cp "$DOTFILES_DIR/package.json" "$CONFIG_DIR/"

# 3. 复制 agents
echo "[3/5] 复制 agents..."
mkdir -p "$AGENTS_DIR"
if [ -d "$DOTFILES_DIR/agents" ]; then
    cp -r "$DOTFILES_DIR/agents/"* "$AGENTS_DIR/"
fi

# 4. 复制 skills
echo "[4/5] 复制 skills..."
mkdir -p "$SKILLS_DIR"
if [ -d "$DOTFILES_DIR/skills" ]; then
    cp -r "$DOTFILES_DIR/skills/"* "$SKILLS_DIR/"
fi

# 5. 安装 npm 依赖
echo "[5/5] 安装 npm 依赖..."
cd "$CONFIG_DIR"
npm install 2>/dev/null || echo "  (可选: 需要Node.js)"

echo ""
echo "========================================"
echo "同步完成！"
echo "========================================"
echo ""
echo "请重启 OpenCode 使配置生效"