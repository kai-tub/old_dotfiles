#!/usr/bin/env bash

# Maybe don't set -e if non-zero if already installed
set -e

if ! command -v flatpak &> /dev/null; then
    echo "Requires flatpak to be installed!"
    echo "Returning without doing something"
    exit 0
fi
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.libretro.RetroArch -y --noninteractive --user
flatpak install flathub com.spotify.Client -y --noninteractive --user
flatpak install flathub org.signal.Signal -y --noninteractive --user
flatpak install flathub org.gimp.GIMP -y --noninteractive --user
flatpak install flathub org.telegram.desktop -y --noninteractive --user
flatpak install flathub org.videolan.VLC -y --noninteractive --user
flatpak install flathub com.discordapp.Discord -y --noninteractive --user
flatpak install flathub org.audacityteam.Audacity -y --noninteractive --user
flatpak install flathub org.inkscape.Inkscape -y --noninteractive --user
flatpak install flathub tv.kodi.Kodi -y --noninteractive --user
flatpak install flathub com.slack.Slack -y --noninteractive --user
flatpak install flathub com.todoist.Todoist -y --noninteractive --user
flatpak install flathub com.uploadedlobster.peek -y --noninteractive --user
flatpak install flathub nz.mega.MEGAsync -y --noninteractive --user
flatpak install flathub com.makemkv.MakeMKV -y --noninteractive --user
flatpak install flathub net.ankiweb.Anki -y --noninteractive --user
flatpak install flathub org.gnome.baobab -y --noninteractive --user
flatpak install flathub fr.handbrake.ghb -y --noninteractive --user
flatpak install flathub org.jdownloader.JDownloader -y --noninteractive --user
flatpak install flathub com.sublimetext.three -y --noninteractive --user
flatpak install flathub com.teamspeak.TeamSpeak -y --noninteractive --user
flatpak install flathub com.github.phase1geo.minder -y --noninteractive --user
flatpak install flathub com.github.johnfactotum.Foliate -y --noninteractive --user
flatpak install flathub org.keepassxc.KeePassXC -y --noninteractive --user
flatpak install flathub com.jgraph.drawio.desktop -y --noninteractive --user

