#!/usr/bin/env bash

set -e

repo="microsoft/cascadia-code"
full_repo="https://api.github.com/repos/${repo}/releases/latest"
URL=$(curl -s "${full_repo}" | grep "browser_download_url" | cut -d '"' -f 4 | fzf)
tmp_dir=$(mktemp -d -t font-builder-XXXXXXXXXX)
trap '{ rm -rf $tmp_dir; }' EXIT
cd "$tmp_dir"
echo "Working in $tmp_dir"
curl -sL "$URL" -o cascadia-code.zip
mkdir cascadia-code
unzip cascadia-code.zip -d cascadia-code
font_folder="$HOME/.local/share/fonts/opentype"
mkdir -p "$font_folder"
cp -r cascadia-code/otf/* "$font_folder"
fc-cache -f -v
rm -rf "$tmp_dir"
