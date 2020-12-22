#!/usr/bin/env bash

set -e

repo="justjanne/powerline-go"
full_repo="https://api.github.com/repos/${repo}/releases/latest"
tmp_dir=$(mktemp -d -t powerlinego-XXXXXXXXXX)
trap '{ rm -rf $tmp_dir; }' EXIT
cd "$tmp_dir"
echo "Working in $tmp_dir"
URL=$(curl -s "${full_repo}" | grep "browser_download_url" | cut -d '"' -f 4 | fzf)
curl -sOL "$URL"
mv powerline-go-* ~/bin/powerline-go
chmod +x ~/bin/powerline-go
