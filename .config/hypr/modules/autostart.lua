-------------------
---- AUTOSTART ----
-------------------

local startup = {
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE",
    "gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice", -- Set cursor theme in gsettings 
    "hyprctl setcursor Bibata-Modern-Ice 24", -- Set cursor theme for hyprland

    "wl-clip-persist --clipboard regular", -- Enables clipboard persistence
    "wl-paste --type text --watch cliphist -max-items=35 store", -- Enable clipboard for text
    "wl-paste --type image --watch cliphist -max-items=10 store", -- Enable clipboard for images

    "awww-daemon",
    "waybar",
    "swaync",
    "hypridle", -- "Idle daemon"
    os.getenv("HOME") .. "/.local/bin/at_startup" -- Misc user defined custom shell scripts
}

hl.on("hyprland.start", function()
    for i = 1, #startup do
        hl.exec_cmd(startup[i])
    end
end)
