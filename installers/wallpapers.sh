#!/usr/bin/env bash

# Wallpapers Installer
#
# Installs wallpapers and generates thumbnails.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency rsync "sudo pacman -S rsync"


# -----------------------------------------------------------------------------
# Directories
# -----------------------------------------------------------------------------

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

mkdir -p "$WALLPAPER_DIR"


# -----------------------------------------------------------------------------
# Install Wallpapers
# -----------------------------------------------------------------------------

rsync -av --delete \
    "$ROOT_DIR/wallpapers/" \
    "$WALLPAPER_DIR/"

# -----------------------------------------------------------------------------
# Generate Thumbnails
# -----------------------------------------------------------------------------

auto_walls rofi --gen-thumbnails