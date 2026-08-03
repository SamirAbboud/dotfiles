#!/usr/bin/env bash

# VSCodium Installer
#
# Configures VSCodium settings, themes and extensions.

set -euo pipefail

readonly DEFAULT_EXTENSIONS=(
    arcticicestudio.nord-visual-studio-code
    bradlc.vscode-tailwindcss
    catppuccin.catppuccin-vsc
    ecmel.vscode-html-css
    enkia.tokyo-night
    jarith.everforest-night-vscode
    jdinhlife.gruvbox
    kamikillerto.vscode-colorize
    miguelsolorio.fluent-icons
    pkief.material-icon-theme
    venage5603.tokyo-night-dark-enhanced
    zhuangtongfa.material-theme
)

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency codium "yay -S vscodium-bin"
check_dependency jq "sudo pacman -S jq"


# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

load_theme() {
    local theme="${1:-$THEME}"

    source "$SCRIPT_DIR/themes/$theme.sh"
}

apply_vscode_theme() {
    local settings="$HOME/.config/VSCodium/User/settings.json"

    [[ -f "$settings" ]] || return

    jq \
        --arg theme "$VSCODE_THEME" \
        '.["workbench.colorTheme"] = $theme' \
        "$settings" > "$settings.tmp"

    mv "$settings.tmp" "$settings"
}

configure_vscodium() {
    echo
    info "Configuring VSCodium..."

    mkdir -p "$HOME/.config/VSCodium/User"

    cp \
        "$ROOT_DIR/.config/VSCodium/User/settings.json" \
        "$HOME/.config/VSCodium/User/settings.json"
}

install_default_extensions() {
    local installed

    installed="$(codium --list-extensions)"

    for extension in "${DEFAULT_EXTENSIONS[@]}"; do
        if ! grep -Fxq "$extension" <<< "$installed"; then
            info "Installing $extension..."
            codium --install-extension "$extension" >/dev/null 2>&1
        fi
    done
}

# -----------------------------------------------------------------------------
# Configure VSCodium
# -----------------------------------------------------------------------------

load_theme
configure_vscodium
apply_vscode_theme
install_default_extensions