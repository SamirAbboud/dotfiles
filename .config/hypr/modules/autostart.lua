-------------------
---- AUTOSTART ----
-------------------

local startup = {
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",  -- Update some dbus variables
    "gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice", -- Set cursor theme in gsettings 
    "hyprctl setcursor Bibata-Modern-Ice 24", -- Set cursor theme for hyprland

    "wl-clip-persist --clipboard regular", -- Enables clipboard persistence
    "wl-paste --type text --watch cliphist -max-items=35 store", -- Enable clipboard for text
    "wl-paste --type image --watch cliphist -max-items=10 store", -- Enable clipboard for images

    "awww-daemon",
    "waybar",
    "swaync",
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1", -- PolicyKit authentication agent
    "hypridle", -- "Idle daemon"
    -- "nwg-dock-hyprland -p left -d -w 5 -nolauncher -ml 5 -l top -hl bottom -i 38", -- dock
    "~/.local/bin/at_startup" -- Misc user defined custom shell scripts
}

hl.on("hyprland.start", function()
    for i = 1, #startup do
        hl.exec_cmd(startup[i])
    end
end)
