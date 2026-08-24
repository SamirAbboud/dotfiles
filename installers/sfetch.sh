#!/usr/bin/env bash

# Sfetch Installer
#
# Installs and configures sfetch.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency curl "sudo pacman -S curl"
check_dependency git "sudo pacman -S git"
check_dependency rustup "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"


# -----------------------------------------------------------------------------
# Install Sfetch
# -----------------------------------------------------------------------------

cargo install --git https://github.com/SamirAbboud/sfetch.git --force --locked


# -----------------------------------------------------------------------------
# Configure Sfetch
# -----------------------------------------------------------------------------

copy_config sfetch