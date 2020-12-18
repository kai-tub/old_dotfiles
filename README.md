# Dotfiles

This is my collection of dotfiles and scripts.
To run scripts located in `bin` the following
packages have to be installed:
- `git`
- `fzf`
- `bash`
- `curl`

## Fresh-install
1. `./install`
1. `bash bin/install_cascadia_fonts.sh`
1. `bash bin/download_powerline-go.sh`
1. `python bin/append_to_shellfile.py`
1. `bash bin/miniconda_installer.sh`
1. `bash bin/create_conda_envs.sh`
1. `cd` to local bin folder: `bash bin/link_fish_here.sh`


### TODO:
Automatically add `my_bashrc` somehow.