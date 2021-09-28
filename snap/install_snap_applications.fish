#!/usr/bin/env fish

if ! command -q snap
    echo "Requires snap to be installed!"
    echo "Returning without doing something"
    exit 0
end

function install_classic_snaps
    for pkg in $argv
        sudo snap install --classic "$pkg"
    end
end

function install_snaps
    for pkg in $argv
        sudo snap install "$pkg"
    end
end

set classic_tools \
    code \
    sublime-text

install_classic_snaps $classic_tools

set tools \
    ffmpeg

install_snaps $tools
