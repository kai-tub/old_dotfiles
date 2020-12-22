#!/usr/bin/env bash

# Maybe don't set -e if non-zero if already installed
set -e

if ! command -v flatpak &> /dev/null; then
    echo "Requires flatpak to be installed!"
    echo "Returning without doing something"
    exit 0
fi

flatpak install flathub org.libretro.RetroArch -y --noninteractive
flatpak install flathub com.spotify.Client -y --noninteractive
flatpak install flathub org.signal.Signal -y --noninteractive
flatpak install flathub org.gimp.GIMP -y --noninteractive
flatpak install flathub org.telegram.desktop -y --noninteractive
flatpak install flathub com.visualstudio.code -y --noninteractive
flatpak install flathub org.videolan.VLC -y --noninteractive
flatpak install flathub com.discordapp.Discord -y --noninteractive
flatpak install flathub org.audacityteam.Audacity -y --noninteractive
flatpak install flathub org.inkscape.Inkscape -y --noninteractive
flatpak install flathub tv.kodi.Kodi -y --noninteractive
flatpak install flathub com.slack.Slack -y --noninteractive
flatpak install flathub com.todoist.Todoist -y --noninteractive
flatpak install flathub com.uploadedlobster.peek -y --noninteractive
flatpak install flathub nz.mega.MEGAsync -y --noninteractive
flatpak install flathub com.makemkv.MakeMKV -y --noninteractive
flatpak install flathub net.ankiweb.Anki -y --noninteractive
flatpak install flathub org.gnome.baobab -y --noninteractive
flatpak install flathub fr.handbrake.ghb -y --noninteractive
flatpak install flathub org.jdownloader.JDownloader -y --noninteractive
flatpak install flathub com.sublimetext.three -y --noninteractive
flatpak install flathub com.teamspeak.TeamSpeak -y --noninteractive
flatpak install flathub com.github.phase1geo.minder -y --noninteractive
flatpak install flathub com.github.johnfactotum.Foliate -y --noninteractive
flatpak install flathub org.keepassxc.KeePassXC -y --noninteractive
flatpak install flathub com.jgraph.drawio.desktop -y --noninteractive
