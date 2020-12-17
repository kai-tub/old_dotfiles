#!/usr/bin/env bash

set -e

ENVS="$HOME/.conda_envs/*.yml"

for env in $ENVS; do
    echo "Trying to build environment: $env"
    conda env create --force -f "$env"
done
