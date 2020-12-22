#!/usr/bin/env bash

set -e

if ! command -v fish &> /dev/null; then
    # First search in miniconda
    find "$HOME/miniconda" -type d \( -name pkgs \) -prune -false -o -name "fish" -type f  -exec ln -s {} . \; -quit
    # FUTURE: Crawl through more folders
else
    echo "fish already in PATH! Nothing will be changed."
fi

if ! command -v fish_ident &> /dev/null; then
    find "$HOME/miniconda" -type d \( -name pkgs \) -prune -false -o -name "fish_indent" -type f  -exec ln -s {} . \; -quit
else
    echo "fish_ident already in PATH! Nothing will be changed."
fi
