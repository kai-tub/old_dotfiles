#!/usr/bin/env bash

set -e

repo="rhysd/notes-cli"
full_repo="https://api.github.com/repos/${repo}/releases/latest"
URL=$(curl -s "${full_repo}" | grep "browser_download_url" | cut -d '"' -f 4 | fzf)
tmp_dir=$(mktemp -d -t notes-cli-XXXXXXXXXX)
trap '{ rm -rf $tmp_dir; }' EXIT
cd "$tmp_dir"
echo "Working in $tmp_dir"
curl -sL "$URL" -o notes.zip
unzip notes.zip
find . -name "notes" -type f -exec mv {} ~/bin/ \;
chmod +x ~/bin/notes
