#!/usr/bin/env bash

set -e

target_dir="$HOME/miniconda"

conda_init(){
    # shellcheck source=/dev/null
    source "$target_dir/bin/activate"
    conda init # For bash
    conda init fish # For fish
}

if command -v conda &> /dev/null; then
    echo "Miniconda already installed"
    conda_init
    exit 0
fi

if [ -d "$target_dir" ]; then
    echo "$target_dir directory already exists!"
    exit 1
fi

tmp_dir=$(mktemp -d -t miniconda-installer-XXXXXXXXXX)
trap '{ rm -rf $tmp_dir; }' EXIT
cd "$tmp_dir"
echo "Working in $tmp_dir"
curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output miniconda.sh
if [ ! -f miniconda.sh ]; then
    echo "Failed to download latest miniconda script!"
    exit 1
fi

bash miniconda.sh -b -p "$target_dir"
conda_init
# conda env install -f masterthesis.yml
# conda activate masterthesis
# python -m ipykernel install --user --name masterthesis
# On windows one needs to first activate the environment masterthesis
# and then load the jupyter environment directly