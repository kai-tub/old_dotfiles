# Dotfiles

This repository is my collection of dotfiles and scripts.
To run scripts located in `scripts`, the following
packages have to be installed:
- `git`
- `bash`
- `curl`

## Base Install
1. Simply run `./install`

Note: Installer will also try to install Cascadia Font.

## Admin Install
If root privileges are available, first install `flatpak`:
```bash
# Distro based-packages are out-of-date!
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt-get update
sudo apt-get install flatpak
```
Then re-run `./install` to install all GUI applications. (Doesn't require root)

Do not forget to add `megasync` to the autostart configuration, if desired:
```bash
mkdir -p ~/config/autostart/
ln -s /var/lib/flatpak/exports/share/applications/nz.mega.MEGAsync.desktop ~/.config/autostart/
```

Other applications that require root rights are:
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

## Tools that require docker
- [Sherlock](https://github.com/sherlock-project/sherlock)

## Windows
If the time comes when I need to set up a Windows machine again, here are a couple of
interesting links:
- Windows Package Manager: [Chocolatey](https://chocolatey.org/)
- Windows 10 [Debloater script](https://github.com/Sycnex/Windows10Debloater)
- [Windows Dev Box setup](https://github.com/Microsoft/windows-dev-box-setup-scripts) (requires admin rights)

## Tmux
I've had some issues with the default color settings on
Ubuntu 20.04 and `tmux`:

`"Error opening terminal: xterm-256color."`

The answer implied from [SO](https://stackoverflow.com/a/6791510):

`sudo ln -sf /usr/share/terminfo/x/xterm-color /usr/share/terminfo/x/xterm-256color` (could maybe also just change the tmux configuration?)
