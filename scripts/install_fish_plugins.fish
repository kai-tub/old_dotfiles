#!/usr/bin/env fish

if ! command -q fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Starship includes a well-functioning done implementation
# if grep -qEi "(Microsoft|WSL)" /proc/version &>/dev/null
#     echo "Not installing _done_ as it currently has issues with WSL!"
#     echo "See https://github.com/franciscolourenco/done/issues/94"
# else
#     fisher install franciscolourenco/done
# end

# See `fish_plugins` file for which plugins are installed
fisher update
