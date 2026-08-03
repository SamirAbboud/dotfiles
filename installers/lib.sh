#!/usr/bin/env bash

# Shared Library
#
# This file contains shared configuration variables and helper functions
# used by all installer scripts.
#
# It is intended to be sourced, not executed directly.


# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------

THEME="tokyodark"

THEMES=(
    tokyodark
    tokyonight
    catppuccin
    gruvbox
    everforest
    nord
    onedark
)

GTK_SOURCE_DIR="/tmp/dracula-gtk"
ICON_SOURCE_DIR="/tmp/Tela-icon-theme"


# -----------------------------------------------------------------------------
# Terminal Colors
# -----------------------------------------------------------------------------

COLOR_RESET="\033[0m"

COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_YELLOW="\033[1;33m"
COLOR_RED="\033[1;31m"

# -----------------------------------------------------------------------------
# Logging
# -----------------------------------------------------------------------------

info() {
    echo -e "${COLOR_BLUE}==>${COLOR_RESET} $*"
}

success() {
    echo -e "${COLOR_GREEN}==>${COLOR_RESET} $*"
}

warning() {
    echo -e "${COLOR_YELLOW}==> Warning:${COLOR_RESET} $*"
}

error() {
    echo -e "${COLOR_RED}==> Error:${COLOR_RESET} $*"
}

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

copy_config() {
    local app="$1"

    rm -rf "$HOME/.config/$app"
    cp -a "$ROOT_DIR/.config/$app" "$HOME/.config/"
}

link_file() {
    local source="$1"
    local target="$2"

    ln -sfn "$source" "$target"
}

# link_theme <app> <extension> <target> [theme_dir]
#
# Creates a symlink to the active theme file.
# The optional theme_dir defaults to "themes".
link_theme() {
    local app="$1"
    local extension="$2"
    local target="$3"
    local theme_dir="${4:-themes}"

    link_file \
        "$HOME/.config/$app/$theme_dir/$THEME.$extension" \
        "$HOME/.config/$app/$target"
}

check_dependency() {
    local command="$1"
    local install="$2"

    if ! command -v "$command" >/dev/null 2>&1; then
        echo
        error "'$command' is not installed."
        echo
        echo "Install with:"
        echo "  $install"
        echo
        exit 1
    fi
}