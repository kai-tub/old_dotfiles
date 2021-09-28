#!/bin/bash

sudo apt-get update && \
sudo apt-get install \
	git curl terminator

if (command -v flatpak &> /dev/null) || (command -v snapd &> /dev/null); then
	sudo apt-get install flatpak snapd
	echo "Requires restart or logging out" >&2
	exit 1
fi


# maybe also chrome
# https://www.ubuntuupdates.org/ppa/google_chrome
