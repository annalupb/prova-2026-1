#!/usr/bin/env bash

set -e

echo "[1/4] Installing Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "[2/4] Configuring Homebrew in the shell startup file..."
echo >> /home/codespace/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/codespace/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

echo "[3/4] Installing Typst and verifying the installation..."

brew install typst
typst --version

echo "[4/4] Creating the virtual environment with uv"

uv sync

echo "Setup complete."