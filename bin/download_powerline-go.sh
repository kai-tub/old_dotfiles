#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"

repo="justjanne/powerline-go"
full_repo="https://api.github.com/repos/${repo}/releases/latest"
URL=$(curl -s "${full_repo}" | grep "browser_download_url" | cut -d '"' -f 4 | fzf)
curl -sOL "$URL"
mv powerline-go-* powerline-go
chmod +x powerline-go
