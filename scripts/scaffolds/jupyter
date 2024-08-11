#!/usr/bin/env bash

set -euo pipefail

source "$DOTLY_PATH/scripts/core/_main.sh"

##? Add current environment to jupyter
##?
##? Usage:
##?    jupyter
docs::parse "$@"

if [ -z "${CONDA_DEFAULT_ENV+x}" ]; then
  echo "No conda environment found"
  exit 1
fi

python -Xfrozen_modules=off -m ipykernel install --user --name=$CONDA_DEFAULT_ENV

