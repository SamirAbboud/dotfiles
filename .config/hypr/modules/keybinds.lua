local scripts      = "~/.local/bin/"
local rofi_scripts = "~/.config/rofi/bin/"

-- Amount of workspaces used, no more than 10
local workspaces   = 5

local terminal    = "kitty"
local fileManager = "thunar"
local code         = "codium"
local browser      = "firefox"

-- Writing hl.ds.exec_cmd() all the time is too long, here is a shortcut
local function run(cmd, window_rules)
    return hl.dsp.exec_cmd(cmd, window_rules)
end


-- Runs script with given name
local function run_script(script_name)
    return hl.dsp.exec_cmd(scripts .. script_name)        
end

-- toggle_rofi is a script that adds toggle behavior to rofi
-- If menu is already shown, script will close it
local function toggle_rofi(cmd)
    return hl.dsp.exec_cmd(scripts .. "toggle_rofi "  .. cmd)
end

local function toggle_rofi_script(script_name)
    return toggle_rofi(rofi_scripts .. script_name)
end

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Launch terminal
hl.bind(mainMod .. " + Return",         run(terminal))
hl.bind(mainMod .. " + SHIFT + Return", run(terminal, {float = true}))

-- Launch some apps
hl.bind(mainMod .. " + B", run(fileManager))
hl.bind(mainMod .. " + N", run(browser))
hl.bind(mainMod .. " + M", run(code))

-- Cycle current workspace layout 
hl.bind(mainMod ..  " + tab",         run_script("cycle_layout"))
hl.bind(mainMod .. " + SHIFT + tab", run_script("cycle_layout --prev"))

-- Toggle swaync
hl.bind(mainMod .. " + T", run("swaync-client -t"))

-- Increment/decrement border size
hl.bind(mainMod .. " + F7", run_script("border_size +1"))
hl.bind(mainMod .. " + F6", run_script("border_size -1"))

-- Increment/decrement rounding
hl.bind(mainMod .. " + F9", run_script("rounding +1"))
hl.bind(mainMod .. " + F8", run_script("rounding -1"))

-- Change theme
hl.bind(mainMod .. " + SHIFT + T", run_script("theme"))

-- Reload hyprland config, misc.disable_autoreload = true
hl.bind(mainMod .. " + R",    run("hyprctl reload"))

-- Window actions
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- Close window
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill()) -- Kill window
hl.bind(mainMod .. " + W",           hl.dsp.window.center()) -- Centers window if it is floating
hl.bind(mainMod .. " + U",           hl.dsp.window.pin())    -- Pins floating window
hl.bind(mainMod .. " + Z",           hl.dsp.window.resize({x = -80, y = -75, relative = true})) -- Make window x-80 y-75 smaller 
hl.bind(mainMod .. " + C",           hl.dsp.window.resize({x =  80, y =  75, relative = true})) -- Make window x+80 y+75 bigger
hl.bind(mainMod .. " + SHIFT + F",   hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + F", function ()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.center())
end) -- Toggle window floating state and center it.


hl.bind(mainMod .. " + P", function ()
    hl.dispatch(hl.dsp.window.float({ action = "off" }))
    hl.dispatch(hl.dsp.window.pseudo())
end) -- Pseudotiles window, ensure it's tiled


-- Minimize active window, Press SUPER + X one more time to show it.
-- https://wiki.hypr.land/0.54.0/Configuring/Uncommon-tips--tricks/#minimize-windows-using-special-workspaces
hl.bind(mainMod .. " + X", function ()
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "+0"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
    hl.dispatch(hl.dsp.window.move({workspace = "special:minimize"}))
    hl.dispatch(hl.dsp.workspace.toggle_special("minimize"))
end)

-- Group binds
hl.bind(mainMod .. " + O",            hl.dsp.group.toggle()) -- Create windows groRup
hl.bind(mainMod .. " + bracketleft",  hl.dsp.group.prev())   -- Show previous window in group
hl.bind(mainMod .. " + bracketright", hl.dsp.group.next())   -- Show next window in group

-- Rofi menus
hl.bind(mainMod .. " + D",              toggle_rofi_script("drun"))                      -- Application launcher
hl.bind(mainMod .. " + V",              toggle_rofi_script("clipboard"))                 -- Clipboard menu
hl.bind(mainMod .. " + E",              toggle_rofi_script("filebrowser"))               -- Tiny dmenu like fikebrowser at the top
hl.bind(mainMod .. " + ESCAPE",         toggle_rofi_script("logout"))                    -- Logout menu
hl.bind(mainMod .. " + SHIFT + D",      toggle_rofi_script("run"))                       -- Raw commands launcher
hl.bind(mainMod .. " + SHIFT + V",      toggle_rofi_script("icons"))                     -- Nerd font glyphs picker
hl.bind(mainMod .. " + CTRL + V",       toggle_rofi_script("emoji"))                     -- Emoji picker
hl.bind(mainMod .. " + Y",              toggle_rofi(scripts .. "auto_walls rofi"))       -- Wallpapers menu


-- Misc bindings
hl.bind(mainMod .. " + CTRL + R",       run("killall waybar ; waybar &"))              -- Restart waybar
hl.bind(mainMod .. " + MINUS",          run_script("volume -2"), {repeating = true})   -- Decrease volume by 2
hl.bind(mainMod .. " + EQUAL",          run_script("volume +2"), {repeating = true})   -- Increase volume by 2

hl.bind(mainMod .. " + SPACE",          run("pkill -SIGRTMIN+1 -f nwg-dock-hyprland")) -- Hide / show dock 
hl.bind(mainMod .. " + period",         run("playerctl next"))                         -- Play next song
hl.bind(mainMod .. " + comma",          run("playerctl previous"))                     -- Play previous song
hl.bind(mainMod .. " + slash",          run("playerctl play-pause"))                   -- Play or pause song
hl.bind(mainMod .. " + SHIFT + slash",  run_script("auto_walls toggle"))               -- Toggle wallpapers cycling 
hl.bind(mainMod .. " + SHIFT + period", run_script("auto_walls next"))                 -- Set next wallpaper
hl.bind(mainMod .. " + SHIFT + comma",  run_script("auto_walls prev"))                 -- Set previous wallpaper

hl.bind("Print",                  run_script("screenshot"))                      -- Screenshot
hl.bind("SHIFT + Print",          run_script("screenshot --select"))             -- Screenshot selected area
hl.bind("CTRL + Print",           run_script("screenrec"))                       -- Screen record
hl.bind("CTRL + SHIFT + Print",   run_script("screenrec --select"))              -- Screen record selected area

-- Move focus:   SUPER + arrow keys
-- Move windows: SUPER + CTRL + arrow keys
-- Swap windows: SUPER + SHIFT + arrow keys
for _, dir in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(mainMod .. " + " .. dir,          hl.dsp.focus({ direction = dir }))
    hl.bind(mainMod .. " + CTRL + " .. dir,   hl.dsp.window.move({ direction = dir }))
    hl.bind(mainMod .. " + SHIFT + " .. dir,  hl.dsp.window.swap({ direction = dir }))
end

-- Resize active window
hl.bind(mainMod .. " + CTRL + SHIFT + left",  hl.dsp.window.resize({ x = -70, y = 0,   relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.resize({ x =  70, y = 0,   relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + up",    hl.dsp.window.resize({ x = 0,   y = -70, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + down",  hl.dsp.window.resize({ x = 0,   y =  70, relative = true }))


-- Switch workspaces: SUPER + [1-workspaces]
-- Move active window to workspace: SUPER + SHIFT [1-workspaces]
-- Move active window to workspace and follow: SUPER + CTRL [1-workspaces]
for i = 1, workspaces do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false}))
    hl.bind(mainMod .. " + CTRL + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Special workspace
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }))
hl.bind(mainMod .. " + CTRL + S",  hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Laptop specific function key binds
hl.bind("XF86AudioNext",        run("playerctl next"),                            { locked = true })
hl.bind("code:172",             run("playerctl play-pause"),                      { locked = true }) -- XF86AudioPlayPause
hl.bind("XF86AudioPause",       run("playerctl pause"),                           { locked = true })
hl.bind("XF86AudioPlay",        run("playerctl play-pause"),                      { locked = true })
hl.bind("XF86KbdBrightnessUp",  run("asusctl leds next"),                         { locked = true,})
hl.bind("XF86KbdBrightnessDown",run("asusctl leds prev"),                         { locked = true,})
hl.bind("Pause",                run("playerctl pause"),                           { locked = true })
hl.bind("XF86AudioMute",        run("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPrev",        run("playerctl previous"),                        { locked = true })
hl.bind("XF86AudioMicMute",     run_script("mictoggle"),                          { locked = true })
hl.bind("XF86AudioRaiseVolume", run_script("volume +5"),                          { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", run_script("volume -5"),                          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  run_script("brightness 5%+"),                     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",run_script("brightness 5%-"),                     { locked = true, repeating = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
