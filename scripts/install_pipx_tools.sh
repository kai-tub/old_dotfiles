#!/usr/bin/env bash

if ! command -v pipx &> /dev/null; then
    echo "You need to install pipx first!"
    exit 0
fi

pipx ensurepath --force
pipx install thefuck
