#!/usr/bin/env bash

# Local Binaries Installer
#
# Installs local scripts and executable utilities into ~/.local/bin.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

if [[ -d "$HOME/.local/bin" && ! -d "$HOME/.local/bin.backup" ]]; then
    cp -a "$HOME/.local/bin" "$HOME/.local/bin.backup"
fi

mkdir -p "$HOME/.local/bin"

cp -a "$ROOT_DIR/.local/bin/." "$HOME/.local/bin/"

link_file \
    "$HOME/autowalls/main.py" \
    "$HOME/.local/bin/auto_walls"

# ln -sfn \
#     "$HOME/.local/bin/auto_walls" \
#     "$HOME/.local/bin/startup/auto_walls"

