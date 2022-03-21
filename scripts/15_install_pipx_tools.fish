#!/usr/bin/env fish

function help
    set scriptname (status -f)
    echo "$scriptname [OPTION]
This scripts installs all of the listed pipx tools.
Requires pipx to be already installed.

Options:
  -u/--upgrade      Upgrade all packages
  -h/--help         Show this help screen
"
end

function help_exit
    help
    exit 1
end

set args h/help u/upgrade
argparse --name=installer $args -- $argv
or help_exit

if set -q _flag_help
    help
    exit 0
end

if ! command -q pipx
    echo "You need to install pipx first!"
    exit 0
end

# Also set here to ensure that it is installed to correct location
set -x PIPX_BIN_DIR "$HOME/bin/"
pipx ensurepath --force

# If pipx name is identical to cmd name just write pipx name
# Otherwise split by sep: == with pipx_name==cmd_name
set sep "=="
set pipxtools \
    poetry \
    thefuck \
    youtube-dl \
    black \
    flake8 \
    rebiber \
    betterbib \
    rich-cli \
    nbpreview \
    httpie==http

if set -q _flag_upgrade
    pipx upgrade-all
    exit 0
end

for p in $pipxtools
    set x (string split "$sep" "$p")
    set pipx_tool_name "$x[1]"
    if test (count $x) -eq 1
        set cmd_name "$x[1]"
    else
        set cmd_name "$x[2]"
    end

    if command -q "$cmd_name"
        echo "Skipping installation of $pipx_tool_name as it is already installed."
    else
        pipx install "$pipx_tool_name"
    end
end
