#!/bin/bash

wget -O miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash miniconda.sh -b -p ./miniconda
source miniconda/bin/activate
conda init # For bash
conda init fish # For fish
# conda env install -f masterthesis.yml
# conda activate masterthesis
# python -m ipykernel install --user --name masterthesis
# On windows one needs to first activate the environment masterthesis
# and then load the jupyter environment directly