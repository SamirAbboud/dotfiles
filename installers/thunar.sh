#!/usr/bin/env bash

# Thunar Installer
#
# Configures Thunar preferences, bookmarks and custom actions.
#
# Requirements:
#   thunar
#   thunar-archive-plugin
#   thunar-volman
#   tumbler
#   ffmpegthumbnailer

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency \
    thunar \
    "sudo pacman -S thunar thunar-archive-plugin thunar-volman tumbler ffmpegthumbnailer"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

configure_bookmarks() {
    info "Configuring bookmarks..."

    mkdir -p "$HOME/.config/gtk-3.0"

    {
        printf 'file://%s/Documents\n' "$HOME"
        printf 'file://%s/Downloads\n' "$HOME"
        printf 'file://%s/Music\n' "$HOME"
        printf 'file://%s/Pictures\n' "$HOME"
        printf 'file://%s/Videos\n' "$HOME"

        if [[ -d /mnt/data ]]; then
            printf 'file:///mnt/data Data\n'
        fi
    } > "$HOME/.config/gtk-3.0/bookmarks"
}


# -----------------------------------------------------------------------------
# Configure Thunar
# -----------------------------------------------------------------------------

info "Configuring Thunar..."

copy_config Thunar
copy_config xfce4

configure_bookmarks