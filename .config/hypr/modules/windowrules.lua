--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- Workspace rules
hl.workspace_rule({ workspace = "special:magic", layout = "dwindle"})

-- Layer rules
hl.layer_rule({
    match = {
        namespace = "swaync-control-center"
    },

    animation = "slide right"
})

hl.window_rule({ float = true, match = { class = "org.telegram.desktop", title = "^(Media viewer)" }})
hl.window_rule({ float = true, match = { class = "zenity", title = "^(Winetricks -)(.*)|winetricks" }})

hl.window_rule({ stay_focused = true, match = { class = "xfce-polkit" }})
hl.window_rule({ stay_focused = true, match = { title = "^(Rename device)$", class = "blueman-manager" }})


-- Tags 
hl.window_rule({ float = true,    match = { tag = "float" }})
hl.window_rule({ opacity = 1,     match = { tag = "opaque" }})
hl.window_rule({ border_size = 2, match = { tag = "bordered" }})


hl.window_rule({
    name = "Float by title",
    match = { 
        title = "Font Manager|Volume Control|Qalculate!|Library|Add bookmark"
    },

    float = true,
    center = true,
    persistent_size = true,
})

hl.window_rule({
    name = "Float by class",
    match = { 
        class = "blueman-manager|blueman-services|nwg-look|rog-control-center|org.qbittorrent.qBittorrent|kvantummanager|\
                 org.gnome.seahorse.Application|xfce-polkit|org.polymc.PolyMC|engrampa|nm-connection-editor|system-config-printer|hyprland-share-picker|\
                 org.bleachbit.BleachBit|vlc|exo-desktop-item-edit|xdg-desktop-portal-gtk|org.gnome.eog|qt6ct|spotify|Spotify|xfce-polkit"
    },

    float = true,
    center = true,
    persistent_size = true,
})

hl.window_rule({
    name = "Thunar dialogs",
    match = {
        class = "thunar|Thunar",
        title = 'Rename "*.*"|File Operation Progress|Confirm to replace files|Attention'
    },

    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "Thunar stayfocused",
    match = {
        class = "thunar|Thunar",
        title = 'Attention|Rename "*.*"|Create Document from .*|New .* ...|Create New Folder'
    },

    stay_focused = true
})

hl.window_rule({
    name = "Thunar move right bottom",
    match = {
        title = "^(File Operation Progress)$",
        class = "(thunar|Thunar)",
    },
    
    focus_on_activate = false,
    move = "1460 970"
})

hl.window_rule({
    name = "Thunar menu force center",
    match = {
        title = "^(Confirm to replace files)$",
        class = "(thunar|Thunar)"
    },

    center = true
})

hl.window_rule({
    name = "Small window size",
    match = {
        class = "org.gnome.seahorse.Application|org.polymc.PolyMC|nwg-look",
    },

    size = "900 600",
    center = true,
})

hl.window_rule({
    name = "Scrolling almost full width",
    match = {
        class = "codium|vesktop|zen",
    },
    
    scrolling_width = 0.95
})

hl.window_rule({
    name = "Kitty opacity and border",
    match = {
        class = "peaclock"
    },

    opacity = "0.9 0.8",
    border_size = 2,
})

hl.window_rule({
    name = "peaclock terminal",
    match = {
        class = "peaclock",
    },

    float = true,
    pin = true,
    size = "500 260",
    move = "711 60",
})