#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Dotfiles Installer
#
# Before running this script, install all required packages listed in:
#
#     requirements.txt
#
# This script sets up the configuration by creating the required
# symlinks and directories under ~/.config and applies any necessary
# one-time installation steps.
# -----------------------------------------------------------------------------

set -euo pipefail

INSTALL_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$INSTALL_DIR/installers/lib.sh"

# -----------------------------------------------------------------------------
# Installers
# -----------------------------------------------------------------------------

"$INSTALL_DIR/installers/applications.sh"
"$INSTALL_DIR/installers/vscodium.sh"
"$INSTALL_DIR/installers/gtk.sh"
"$INSTALL_DIR/installers/utilities.sh"
"$INSTALL_DIR/installers/desktop.sh"
"$INSTALL_DIR/installers/thunar.sh"
"$INSTALL_DIR/installers/local-bin.sh"


# -----------------------------------------------------------------------------
# Finished
# -----------------------------------------------------------------------------

echo
success "Dotfiles installation completed successfully!"
info "You can now log in to your Hyprland session."
info "If you're already in a desktop session, log out and log back in to apply all changes."
echo