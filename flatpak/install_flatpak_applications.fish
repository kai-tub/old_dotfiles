#!/usr/bin/env fish

# Maybe don't set -e if non-zero if already installed

if ! command -q flatpak
    echo "Requires flatpak to be installed!"
    echo "Returning without doing something"
    exit 0
end

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

function install_flathub -a name
    flatpak install flathub "$name" -y --noninteractive --user
end

function install_list
    for pkg in $argv
        install_flathub "$pkg"
    end
end

set messengers \
    com.slack.Slack \
    com.discordapp.Discord \
    org.telegram.desktop \
    org.signal.Signal

install_list $messengers

set entertainment \
    org.videolan.VLC \
    org.libretro.RetroArch \
    com.spotify.Client \
    tv.kodi.Kodi

install_list $entertainment

set media \
    org.jdownloader.JDownloader \
    com.makemkv.MakeMKV \
    fr.handbrake.ghb \
    org.audacityteam.Audacity \
    org.gimp.GIMP \
    org.inkscape.Inkscape \
    # awesome diagramming tool
    com.jgraph.drawio.desktop

install_list $media

set tools \
    # tool to find dead files
    com.github.qarmin.czkawka \
    # tool to anonymously share files
    org.onionshare.OnionShare \
    # KeyVault
    org.keepassxc.KeePassXC \
    # E-Book viewer
    com.github.johnfactotum.Foliate \
    # Disk-Usage analyzer
    org.gnome.baobab \
    net.ankiweb.Anki \
    nz.mega.MEGAsync \
    # Screen Recorder
    com.uploadedlobster.peek \
    com.todoist.Todoist \
    org.jabref.jabref \
    # Tool to easily set flatpak permissions
    com.github.tchx84.Flatseal

install_list $tools

flatpak update -y
# otherwise pollutes terminal
sleep 1
