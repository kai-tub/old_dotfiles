#!/usr/bin/env bash

set -e

ENVS="$HOME/.conda_envs/*.yml"

for env in $ENVS; do
    if [[ "$env" =~ "base.yml" ]]; then
        echo "Updating base environment"
        conda env update -f "$env"
    else
        echo "Trying to build environment: $env"
        conda env create --force -f "$env"
    fi
done
