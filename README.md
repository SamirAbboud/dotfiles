# My Personal Dotfiles

Personal dotfiles and environment configurations for **NixOS** and **Arch Linux** featuring a modern Hyprland desktop, modular Neovim setup, and custom CLI tools.

---

## Architecture Overview

* **Window Manager:** Hyprland with Lua configuration
* **Shell & Tools:** Fish shell (`eza`, `zoxide`, `fzf`, `bat`, `htop`)
* **Text Editors:** Neovim (Modular Lua setup with manual pack manager, LSP with custom setup), VSCodium
* **Typography:** Noto Kufi Arabic, JetBrains Mono, and JetBrainsMono Nerd Font
* **Terminal:** Kitty
* **Bar & Launcher:** Waybar, Rofi (Wayland)

> **NixOS System Configs:** Flakes and system-level definitions are managed in [`nixos-config`](https://github.com/SamirAbboud/nixos-config).

> **Note for Arch Linux Users:** Please ensure you review and install the required packages listed in `requirements.txt` before running the installation script.

---

## Quick Start

### 1. Clone Repository
```fish
git clone git@github.com:SamirAbboud/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run Installer

```fish
chmod +x install.sh
./install.sh
```

## Keybindings Reference

### Applications & Rofi Menus

| Keybinding | Action |
| :--- | :--- |
| `SUPER + Return` | Launch Terminal (`kitty`) |
| `SUPER + SHIFT + Return` | Launch Floating Terminal |
| `SUPER + B` | Launch File Manager (`thunar`) |
| `SUPER + N` | Launch Browser (`firefox`) |
| `SUPER + M` | Launch Code Editor (`codium`) |
| `SUPER + D` | Application Launcher (`rofi drun`) |
| `SUPER + SHIFT + D` | Command Launcher (`rofi run`) |
| `SUPER + V` | Clipboard Menu |
| `SUPER + SHIFT + V` | Icon / Glyphs Picker |
| `SUPER + CTRL + V` | Emoji Picker |
| `SUPER + E` | File Browser Menu |
| `SUPER + ESCAPE` | Logout Menu |
| `SUPER + Y` | Wallpaper Picker (`autowalls rofi`) |

### Window Management & Focus

| Keybinding | Action |
| :--- | :--- |
| `SUPER + Q` | Close Active Window |
| `SUPER + SHIFT + Q` | Kill Active Window |
| `SUPER + W` | Center Floating Window |
| `SUPER + U` | Pin Floating Window |
| `SUPER + F` | Toggle Floating & Center Window |
| `SUPER + SHIFT + F` | Toggle Fullscreen |
| `SUPER + P` | Toggle Pseudo-tile |
| `SUPER + X` | Minimize Window to Special Workspace |
| `SUPER + Z` / `C` | Resize Window Smaller / Larger |
| `SUPER + [Arrow]` | Move Focus (Left / Right / Up / Down) |
| `SUPER + CTRL + [Arrow]` | Move Window |
| `SUPER + SHIFT + [Arrow]` | Swap Window Positions |
| `SUPER + CTRL + SHIFT + [Arrow]` | Fine-tune Window Dimensions |
| `SUPER + Mouse LMB / RMB` | Drag / Resize Window with Mouse |

### Workspaces & Groups

| Keybinding | Action |
| :--- | :--- |
| `SUPER + [1-5]` | Switch to Workspace |
| `SUPER + SHIFT + [1-5]` | Move Window to Workspace |
| `SUPER + CTRL + [1-5]` | Move Window to Workspace & Follow |
| `SUPER + Mouse Scroll` | Cycle Workspaces |
| `SUPER + S` | Toggle Special Workspace ("magic") |
| `SUPER + SHIFT + S` | Move Window to Special Workspace |
| `SUPER + O` | Toggle Window Group |
| `SUPER + [` / `]` | Previous / Next Window in Group |

### Media, Volume & Utilities

| Keybinding | Action |
| :--- | :--- |
| `SUPER + MINUS` / `EQUAL` | Volume -2% / +2% |
| `SUPER + /` | Play / Pause Media (`playerctl`) |
| `SUPER + .` / `,` | Next / Previous Track |
| `SUPER + SHIFT + /` | Toggle Wallpaper Cycling (`autowalls`) |
| `SUPER + SHIFT + .` / `,` | Next / Previous Wallpaper (`autowalls`) |
| `Print` | Capture Full Screenshot |
| `SHIFT + Print` | Capture Area Screenshot |
| `CTRL + Print` | Start Screen Recording |
| `CTRL + SHIFT + Print` | Screen Record Selected Area |
| `SUPER + CTRL + R` | Restart Waybar |
| `SUPER + R` | Reload Hyprland Config |


## Related Repositories

* [**nixos-config**](https://github.com/SamirAbboud/nixos-config) — Declarative NixOS system & Home Manager configurations.
* [**autowalls**](https://github.com/SamirAbboud/autowalls) — Native Rust CLI & daemon for Hyprland background rotation.
* [**sfetch**](https://github.com/SamirAbboud/sfetch) — System information fetch tool.
