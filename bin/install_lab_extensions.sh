#!/usr/bin/env bash

# jupyter lab
# TODO: Check if jupyter exists
# Understand why VIM only works partially
jupyter labextension install @ryantam626/jupyterlab_vim jupyterlab_vim-system-clipboard-support nbdime-jupyterlab
jupyter labextension install @ryantam626/jupyterlab_code_formatter
# Install missing conda dependencies
jupyter serverextension enable --py jupyterlab_code_formatter