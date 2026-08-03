#!/usr/bin/env bash

# Desktop Installer
#
# Installs and configures desktop environment components.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency Hyprland "sudo pacman -S hyprland"
check_dependency hypridle "sudo pacman -S hypridle"
check_dependency hyprlock "sudo pacman -S hyprlock"
check_dependency waybar "sudo pacman -S waybar"
check_dependency swaync "sudo pacman -S swaynotificationcenter"
check_dependency rofi "sudo pacman -S rofi-wayland"
check_dependency nwg-dock-hyprland "sudo pacman -S nwg-dock-hyprland"

check_dependency powerprofilesctl "sudo pacman -S power-profiles-daemon"

check_dependency wl-copy "sudo pacman -S wl-clipboard"
check_dependency cliphist "sudo pacman -S cliphist"
check_dependency wl-clip-persist "sudo pacman -S wl-clip-persist"
check_dependency wtype "sudo pacman -S wtype"


# -----------------------------------------------------------------------------
# Configure Desktop
# -----------------------------------------------------------------------------

# Hyprland
copy_config hypr
cp "$ROOT_DIR/.config/.face.jpg" "$HOME/.config/.face.jpg"

# Waybar
copy_config waybar
link_theme waybar css colors.css

# SwayNC
copy_config swaync
link_theme swaync css colors.css


# Rofi
copy_config rofi
link_theme rofi rasi themes/colors/colors.rasi themes/colors


# nwg-dock-hyprland
copy_config nwg-dock-hyprland
link_theme nwg-dock-hyprland css colors.css
