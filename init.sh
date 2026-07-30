#!/usr/bin/env bash

set -e

echo "[1/5] Installing Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "[2/5] Configuring Homebrew in the shell startup file..."
echo >> /home/codespace/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/codespace/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

echo "[3/5] Installing Typst and verifying the installation..."

brew install typst
typst --version

echo "[4/5] Creating the virtual environment with uv..."

uv sync

echo "[5/5] Installing recommended VS Code extensions (if CLI is available)..."

if command -v code >/dev/null 2>&1; then
	code --install-extension ms-python.python
	code --install-extension myriad-dreamin.tinymist
	code --install-extension mathematic.vscode-pdf
else
	echo "VS Code CLI ('code') not found. Skipping extension installation."
fi

echo "Setup complete. Bora programar!"