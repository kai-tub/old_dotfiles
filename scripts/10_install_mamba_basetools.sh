#!/bin/bash

set -e

if ! command -v mamba &> /dev/null; then
	echo "Mamba needs to be installed!"
	exit 1
fi

# maybe not necessary as mamba init write mamba/bin to PATH
# let's test without it!
# Because needs to ensure that it is not linking to self
link_from_base(){
	mamba run --name base bash -c "ln --symbolic --force $(which $1) $HOME/bin"
}

# will also update
install_fish(){
	mamba install --yes --name base --channel conda-forge fish
	# link_from_base "fish"
	# link_from_base "fish_indent"
}

install_pipx(){
	mamba run --name base python -m pip install --upgrade pipx
	# link_from_base "pipx"
}

install_fish
install_pipx
