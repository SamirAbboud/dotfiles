#!/usr/bin/env bash

# GTK Installer
#
# Installs GTK themes, icon themes and applies desktop appearance settings.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/lib.sh"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

check_dependency git "sudo pacman -S git"
check_dependency sassc "sudo pacman -S sassc"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

load_theme() {
    local theme="${1:-$THEME}"

    source "$SCRIPT_DIR/themes/$theme.sh"
}

needs_gtk_themes() {
    for theme in "${THEMES[@]}"; do
        load_theme "$theme"

        if [[ ! -d "$HOME/.themes/$GTK_THEME" ]]; then
            return 0
        fi
    done

    return 1
}

clone_gtk_theme() {
    if [[ ! -d "$GTK_SOURCE_DIR" ]]; then
        info "Downloading GTK theme source..."

        git clone \
            --depth=1 \
            https://github.com/dracula/gtk.git \
            "$GTK_SOURCE_DIR"
    fi
}

cleanup_gtk_theme() {
    if [[ -d "$GTK_SOURCE_DIR" ]]; then
        info "Cleaning up GTK theme source..."
        rm -rf "$GTK_SOURCE_DIR"
    fi
}

rename_theme_metadata() {
    local theme_dir="$1"

    # Rename theme metadata
    sed -i \
        -e "s/^Name=Dracula$/Name=$THEME_DISPLAY_NAME/" \
        -e "s/^Comment=.*/Comment=$THEME_COMMENT/" \
        -e "s/^GtkTheme=Dracula$/GtkTheme=$THEME_DISPLAY_NAME/" \
        -e "s/^MetacityTheme=Dracula$/MetacityTheme=$THEME_DISPLAY_NAME/" \
        "$theme_dir/index.theme"
}

apply_theme_colors() {
    local colors_file="$1"

    # Add accent after the main colors
    sed -i "/^\\\$fg_color:/a\\
\\
\\\$accent: $ACCENT;" "$colors_file"

    # Main colors
    sed -i "s/^\\\$base_color:.*/\$base_color: $BASE_COLOR;/" "$colors_file"
    sed -i "s/^\\\$bg_color:.*/\$bg_color: $BG_COLOR;/" "$colors_file"
    sed -i "s/^\\\$text_color:.*/\$text_color: $TEXT_COLOR;/" "$colors_file"
    sed -i "s/^\\\$fg_color:.*/\$fg_color: $FG_COLOR;/" "$colors_file"

    # Accent colors
    sed -i "s/^\\\$purple:.*/\$purple: $PURPLE;/" "$colors_file"
    sed -i "s/^\\\$blue:.*/\$blue: $BLUE;/" "$colors_file"
    sed -i "s/^\\\$slider:.*/\$slider: $SLIDER;/" "$colors_file"

    # Selection
    sed -i "s/^\\\$selected_fg_color:.*/\$selected_fg_color: $SELECTED_FG;/" "$colors_file"
    sed -i "s/^\\\$selected_bg_color:.*/\$selected_bg_color: $SELECTED_BG;/" "$colors_file"
}

build_gtk_theme() {
    local theme_name="$1"
    local theme_dir="$2"

    info "Building GTK CSS for $theme_name..."

    # GTK 3.20
    sassc "$theme_dir/gtk-3.20/gtk.scss"      "$theme_dir/gtk-3.20/gtk.css"         2>/dev/null
    sassc "$theme_dir/gtk-3.20/gtk-dark.scss" "$theme_dir/gtk-3.20/gtk-dark.css"    2>/dev/null

    # GTK 4.0
    sassc "$theme_dir/gtk-4.0/gtk.scss"       "$theme_dir/gtk-4.0/gtk.css"          2>/dev/null
    sassc "$theme_dir/gtk-4.0/gtk-dark.scss"  "$theme_dir/gtk-4.0/gtk-dark.css"     2>/dev/null

    # Keep GTK 3.0 identical to GTK 3.20
    cp "$theme_dir/gtk-3.20/gtk.css"      "$theme_dir/gtk-3.0/gtk.css"
    cp "$theme_dir/gtk-3.20/gtk-dark.css" "$theme_dir/gtk-3.0/gtk-dark.css"
}

install_gtk_theme() {
    local theme_name="$1"
    local theme_dir="$HOME/.themes/$theme_name"
    local colors_path="$theme_dir/gtk-3.20/_colors.scss"

    if [[ ! -d "$theme_dir" ]]; then
        info "Installing $theme_name..."

        mkdir -p "$HOME/.themes"

        cp -a "$GTK_SOURCE_DIR" "$theme_dir"

        rename_theme_metadata "$theme_dir"
        apply_theme_colors "$colors_path"
        build_gtk_theme "$theme_name" "$theme_dir"
    fi
}

needs_tela_icons() {
    for theme in "${THEMES[@]}"; do
        load_theme "$theme"

        if [[ ! -d "$HOME/.icons/$ICON_THEME" ]]; then
            return 0
        fi
    done

    return 1
}

clone_tela_icons() {
    if [[ ! -d "$ICON_SOURCE_DIR" ]]; then
        info "Downloading Tela icon theme..."

        git clone \
            --depth=1 \
            https://github.com/vinceliuice/Tela-icon-theme.git \
            "$ICON_SOURCE_DIR"
    fi
}

cleanup_tela_icons() {
    if [[ -d "$ICON_SOURCE_DIR" ]]; then
        info "Cleaning up Tela icon theme..."
        rm -rf "$ICON_SOURCE_DIR"
    fi
}

install_icon_theme() {
    local icon_theme="$1"
    local icon_theme_dir="$HOME/.icons/$icon_theme"
    local icon_color="$2"

    if [[ ! -d "$icon_theme_dir" ]]; then
        info "Installing $icon_theme..."

        mkdir -p "$HOME/.icons"

        "$ICON_SOURCE_DIR/install.sh" \
            -d "$HOME/.icons" \
            "$icon_color"
    fi
}

configure_gtk() {
    local gtk_theme_dir="$HOME/.themes/$GTK_THEME"

    # GTK 2
    copy_config gtk-2.0
    cp \
        "$HOME/.config/gtk-2.0/themes/$THEME" \
        "$HOME/.gtkrc-2.0"

    # GTK 3
    copy_config gtk-3.0
    link_theme gtk-3.0 ini settings.ini

    # GTK 4
    copy_config gtk-4.0
    link_theme gtk-4.0 ini settings.ini

    link_file \
        "$gtk_theme_dir/gtk-4.0/gtk.css" \
        "$HOME/.config/gtk-4.0/gtk.css"

    link_file \
        "$gtk_theme_dir/gtk-4.0/gtk-dark.css" \
        "$HOME/.config/gtk-4.0/gtk-dark.css"

    link_file \
        "$gtk_theme_dir/assets" \
        "$HOME/.config/assets"


    # xsettingsd
    copy_config xsettingsd
    link_theme xsettingsd conf xsettingsd.conf
}

apply_theme() {
    # Apply theme
    gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
    gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"

    # Reset Flatpak overrides
    if command -v flatpak >/dev/null; then
        flatpak override --user --reset
    fi
}

# -----------------------------------------------------------------------------
# Install Themes
# -----------------------------------------------------------------------------

if needs_gtk_themes; then
    clone_gtk_theme
fi

if needs_tela_icons; then
    clone_tela_icons
fi

for theme in "${THEMES[@]}"; do
    load_theme "$theme"

    install_gtk_theme "$GTK_THEME"
    install_icon_theme "$ICON_THEME" "$ICON_COLOR"
done

cleanup_gtk_theme
cleanup_tela_icons

# -----------------------------------------------------------------------------
# Configure Desktop
# -----------------------------------------------------------------------------

# Reload the active/default theme
load_theme

configure_gtk
apply_theme
