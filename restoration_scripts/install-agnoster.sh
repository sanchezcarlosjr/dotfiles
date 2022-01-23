#!/usr/bin/env bash

set -euo pipefail

sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/sanchezcarlosjr/dotfiles/HEAD/plugins/install-powerline-themes.sh)" -- \
    -t agnoster