# Dotfiles

This is my collection of dotfiles and scripts.
To run scripts located in `scripts` the following
packages have to be installed:
- `git`
- `bash`
- `curl`

## Base Install
1. `./install`
1. `cd ~`
1. `bash scripts/create_conda_envs.sh`
1. `mkdir -p ~/bin`
1. `cp ~/scripts/link_fish_here.sh ~/bin/link_fish_here.sh`
1. `cd ~/bin && bash link_fish_here.sh`
    - This is the best option for now, the next release may include an `AppImage`
1. `bash ~/scripts/install_pipx_tools.sh`
    - Requires conda to be installed first!
1. `install_lab_extensions.sh` to desired environments
1. Re-run `./install` to run following commands:
    - `fish scripts/install_fish_plugins.fish`
    - `fish scripts/install_cli_tools.fish`

## Admin Install
If root privileges are available, first install `flatpak`:
```bash
sudo apt-get install flatpak
```
Then run `bash flatpak/install_gui_applications` to install all GUI applications. (Doesn't require root)

Do not forget to add `megasync` to the autostart configuration, if desired:
```bash
mkdir -p ~/config/autostart/
ln -s /var/lib/flatpak/exports/share/applications/nz.mega.MEGAsync.desktop ~/.config/autostart/
```

Other applications that require root rights, are:
```bash
sudo apt-get install terminator
sudo apt-get install git # if necessary
sudo apt-get install curl # if necessary
sudo apt-get install chrome # if available, otherwise follow instruction to install package
sudo apt-get install ffmpeg # ffmpeg could help for other applications
sudo apt-get install pympress # FUTURE: Add pympress to flatpak
```

## Root-configurations
```bash
sudo update-alternatives --config x-terminal-emulator # Set default terminal to terminator; Doesn't affect nautilus settings
```

## Fish command abbreviations
- `Ctrl+F` or `s` (search) to search recursively through the current directory with file preview.
- `f` runs `thef***` command.
- `gs` runs the interactive `git status` with file preview.
- `sv` searches fish variables

## Windows
If the time comes when I need to set up a Windows machine again, here are a couple of
interesting links:
- Windows Package Manager: [Chocolatey](https://chocolatey.org/)
- Windows 10 [Debloater script](https://github.com/Sycnex/Windows10Debloater)
- [Windows Dev Box setup](https://github.com/Microsoft/windows-dev-box-setup-scripts) (requires admin rights)
