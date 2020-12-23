#!/usr/bin/env fish

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

if grep -qEi "(Microsoft|WSL)" /proc/version &>/dev/null
    echo "Not installing _done_ as it currently has issues with WSL!"
    echo "See https://github.com/franciscolourenco/done/issues/94"
else
    fisher install franciscolourenco/done
end

fisher install PatrickF1/fzf.fish
