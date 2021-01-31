#!/usr/bin/env bash

if ! command -v pipx &> /dev/null; then
    echo "You need to install pipx first!"
    exit 0
fi

# Also set here to ensure that it is installed to correct location
export PIPX_BIN_DIR="$HOME/bin/"

pipx ensurepath --force
pipx install thefuck
pipx install youtube-dl
pipx install black
pipx install flake8
pipx install rebiber
pipx install betterbib
