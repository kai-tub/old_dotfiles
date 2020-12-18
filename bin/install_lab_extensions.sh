#!/usr/bin/env bash

if ! command -v jupyter &> /dev/null; then
    echo "Command *jupyter* not found!"
    echo "Maybe you need to activate environment first?"
    exit 1
else 
    if ! jupyter --help | grep -w lab &> /dev/null; then
        echo "jupyter *lab* not installed!"
    else
        echo "Using following jupyter:"
        which jupyter
    fi
fi

# Set e after checking for jupyter
set -e

# Understand why VIM only works partially
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter labextension install nbdime-jupyterlab
# TODO: Install missing conda dependencies, if necessary
jupyter serverextension enable --py jupyterlab_code_formatter
# See: https://jupyterlab-code-formatter.readthedocs.io/en/latest/faq.html#error-when-writing-grammar-tables
python -c "import black; black.CACHE_DIR.mkdir(parents=True, exist_ok=True)"

jupyter labextension install @axlair/jupyterlab_vim
jupyter labextension install jupyterlab-vimrc

jupyter lab build