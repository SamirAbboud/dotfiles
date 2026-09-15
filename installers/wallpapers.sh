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

check_dependency git "sudo pacman -S git"
check_dependency rustup "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
check_dependency rsync "sudo pacman -S rsync"
check_dependency ffmpeg "sudo pacman -S ffmpeg"
check_dependency rofi "sudo pacman -S rofi"
check_dependency awww "sudo pacman -S awww"

# -----------------------------------------------------------------------------
# Install Autowalls
# -----------------------------------------------------------------------------

cargo install --git https://github.com/SamirAbboud/autowalls.git --force --locked


# -----------------------------------------------------------------------------
# Directories & Config
# -----------------------------------------------------------------------------

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

mkdir -p "$WALLPAPER_DIR"

copy_config autowalls


# -----------------------------------------------------------------------------
# Install Wallpapers
# -----------------------------------------------------------------------------

rsync -av --delete \
    "$ROOT_DIR/wallpapers/" \
    "$WALLPAPER_DIR/"

# -----------------------------------------------------------------------------
# Generate Thumbnails
# -----------------------------------------------------------------------------

autowalls rofi --gen-thumbnails
