#!/usr/bin/env bash

set -e

target_dir="$HOME/mambaforge"

mamba_init(){
    # shellcheck source=/dev/null
    source "$target_dir/bin/activate"
    mamba init # For bash
    mamba init fish # For fish
}

if command -v mamba &> /dev/null; then
    echo "Mamba already installed"
    exit 0
fi

if [ -d "$target_dir" ]; then
    echo "$target_dir directory already exists!"
    exit 1
fi

tmp_dir=$(mktemp -d -t mambaforge-installer-XXXXXXXXXX)
trap '{ rm -rf $tmp_dir; }' EXIT
cd "$tmp_dir"
echo "Working in $tmp_dir"
wget -O Mambaforge.sh https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh

if [ ! -f Mambaforge.sh ]; then
    echo "Failed to download latest miniconda script!"
    exit 1
fi

bash Mambaforge.sh -b -p "$target_dir"
mamba_init
