-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

local HOME = os.getenv("HOME")

hl.env("EDITOR", "codium")
hl.env("TERMINAL", "kitty")
hl.env("BROWSER", "firefox")
hl.env("SCRIPTS", HOME .. "/.local/bin")

-- Wayland realted variables
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("DESKTOP_SESSION", "Hyprland")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Toolkit backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- Qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


local XDG_STATE_HOME  = HOME .. "/.local/state" -- App related state files
local XDG_DATA_HOME   = HOME .. "/.local/share" -- App related data 
local XDG_CONFIG_HOME = HOME .. "/.config"      -- App related configuration files
local XDG_CACHE_HOME  = HOME .. "/.cache"       -- App related cache files

-- Global XDG environment variables 
hl.env("XDG_STATE_HOME",  XDG_STATE_HOME)
hl.env("XDG_DATA_HOME",   XDG_DATA_HOME)
hl.env("XDG_CONFIG_HOME", XDG_CONFIG_HOME)
hl.env("XDG_CACHE_HOME",  XDG_CACHE_HOME)


hl.env("XDG_DESKTOP_DIR",     HOME .. "/Desktop")       -- ~/Desktop
hl.env("XDG_DOWNLOAD_DIR",    HOME .. "/Downloads")     -- ~/Downloads
hl.env("XDG_DOCUMENTS_DIR",   HOME .. "/Documents")     -- ~/Documents
hl.env("XDG_PUBLICSHARE_DIR", HOME .. "/Public")        -- ~/Public
hl.env("XDG_MUSIC_DIR",       HOME .. "/Music")         -- ~/Music
hl.env("XDG_PICTURES_DIR",    HOME .. "/Pictures")      -- ~/Pictures
hl.env("XDG_VIDEOS_DIR",      HOME .. "/Videos")        -- ~/Videos
hl.env("XDG_TEMPLATES_DIR",   HOME .. "/Templates")     -- ~/Templates