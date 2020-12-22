# Dotfiles

This is my collection of dotfiles and scripts.
To run scripts located in `bin` the following
packages have to be installed:
- `git`
- `fzf`
- `bash`
- `curl`

## Base Install
1. `./install`
1. `cd ~`
1. `bash scripts/create_conda_envs.sh`
1. `bash scripts/link_fish_here.sh`
    - This is the best option for now, the next release may include an `AppImage`
1. `bash scripts/link_f_here.sh`
    - This will always be the best option
2. `install_lab_extensions.sh` to desired environments

## Admin Install
If root privileges are available, first install `flatpak`:
```bash
sudo apt-get install flatpak
```
Then run `bash flatpak/install_gui_applications` to install all GUI applications. (Doesn't require root)

Other applications that require root rights, are:
```bash
sudo apt-get install terminator
sudo apt-get install git # if necessary
sudo apt-get install curl fzf # if necessary
sudo apt-get install chrome # if available, otherwise follow instruction to install package
```

## Root-configurations
```bash
sudo update-alternatives --config x-terminal-emulator # Set default terminal to terminator; Doesn't affect nautilus settings
```

TODO #1: Add `megasync` on startup
TODO #2: Change download scripts to single python script
TODO #3: Create and change terminator shortcuts
