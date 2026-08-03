#!/usr/bin/env bash

# Utilities Installer
#
# Installs and configures utility applications and tools.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"


# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency flameshot "sudo pacman -S flameshot"

check_dependency blueman-manager "sudo pacman -S blueman"
check_dependency nm-connection-editor "sudo pacman -S nm-connection-editor"

check_dependency missioncenter "sudo pacman -S mission-center"
check_dependency htop "sudo pacman -S htop"
check_dependency nvtop "sudo pacman -S nvtop"
check_dependency powertop "sudo pacman -S powertop"
check_dependency btop "sudo pacman -S btop"

check_dependency nwg-look "sudo pacman -S nwg-look"
check_dependency kvantummanager "sudo pacman -S kvantum"
check_dependency qt6ct "sudo pacman -S qt6ct"

# check_dependency xdg-desktop-portal "sudo pacman -S xdg-desktop-portal"
# check_dependency xdg-desktop-portal-hyprland "sudo pacman -S xdg-desktop-portal-hyprland"

check_dependency eza "sudo pacman -S eza"
check_dependency zoxide "sudo pacman -S zoxide"
check_dependency fzf "sudo pacman -S fzf"
check_dependency duf "sudo pacman -S duf"
check_dependency dust "sudo pacman -S dust"
check_dependency bat "sudo pacman -S bat"
check_dependency tree "sudo pacman -S tree"
check_dependency jq "sudo pacman -S jq"
check_dependency unzip "sudo pacman -S unzip"
check_dependency unrar "sudo pacman -S unrar"

check_dependency ffmpeg "sudo pacman -S ffmpeg"
check_dependency yt-dlp "sudo pacman -S yt-dlp"

check_dependency brightnessctl "sudo pacman -S brightnessctl"
check_dependency nmtui "sudo pacman -S networkmanager"

# -----------------------------------------------------------------------------
# Configure Utilities
# -----------------------------------------------------------------------------

# Sfetch
copy_config sfetch

# Auto_Walls
copy_config auto_walls


# Flameshot
copy_config flameshot


# Kvantum
copy_config Kvantum

# Qt6ct
copy_config qt6ct

# XDG Desktop Portal
copy_config xdg-desktop-portal
