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

conda install -c conda-forge nodejs jupyterlab-git jupyterlab_code_formatter

# Set e after checking for jupyter
set -e

# Understand why VIM only works partially
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter labextension install nbdime-jupyterlab
jupyter serverextension enable --py jupyterlab_code_formatter
# See: https://jupyterlab-code-formatter.readthedocs.io/en/latest/faq.html#error-when-writing-grammar-tables
python -c "import black; black.CACHE_DIR.mkdir(parents=True, exist_ok=True)"

jupyter labextension install jupyterlab-vimrc
# Necessary if jupyter lab <= 3.0.0
jupyter labextension install jupyterlab_vim-system-clipboard-support

tmp_dir=$(mktemp -d -t jupyter-extension-XXXXXXXXXX)
trap '{ rm -rf $tmp_dir; }' EXIT
cd "$tmp_dir"
echo "Working in $tmp_dir"

git clone https://github.com/kai-tub/jupyterlab-vim.git
cd jupyterlab-vim
git checkout kai-branch
jlpm install
jlpm run build
jupyter labextension link .

jupyter lab build
