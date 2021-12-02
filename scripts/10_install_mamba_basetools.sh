#!/bin/bash

set -e
target_dir=$HOME/bin

if ! command -v mamba &> /dev/null; then
	echo "Mamba needs to be installed!"
	exit 1
fi

link_from_base(){
	# Find the base binary directory and link installed packages to target_dir
	mamba run --name base bash -c "ln --symbolic --force $(dirname $(which mamba))/$1 $target_dir/$1"
}

# will also update
install_fish(){
	mamba install --yes --name base --channel conda-forge fish
	link_from_base "fish"
	link_from_base "fish_indent"
	link_from_base "fish_config"
}

install_pipx(){
	mamba run --name base python -m pip install --upgrade pipx
	link_from_base "pipx"
}

install_vim(){
	mamba install --yes --name base --channel conda-forge vim
	link_from_base "vim"
}

install_fish
install_pipx
# install_vim # this will also install perl and overwrite the system perl verison! Will cause issues with latexident because it probably uses a newer perl version!
