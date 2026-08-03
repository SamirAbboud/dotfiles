#!/usr/bin/env bash

# Applications Installer
#
# Installs and configures user applications.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency fish "sudo pacman -S fish"
check_dependency kitty "sudo pacman -S kitty"
check_dependency starship "sudo pacman -S starship"
check_dependency nvim "sudo pacman -S neovim"
check_dependency mpv "sudo pacman -S mpv"


# -----------------------------------------------------------------------------
# Configure Applications
# -----------------------------------------------------------------------------

# Fish
copy_config fish
link_theme fish fish conf.d/theme.fish

# Kitty
copy_config kitty
link_theme kitty conf theme.conf

# Starship
copy_config starship
link_theme starship toml config.toml

# Neovim
copy_config nvim
mkdir -p "$HOME/.local/state/nvim"
printf '%s\n' "$THEME" > "$HOME/.local/state/nvim/theme"

# MPV
copy_config mpv

