-- https://wiki.hypr.land/Configuring/Basics/Binds/

-- Sets "Windows" key as main modifier
local mainMod = "SUPER"

-- Set programs that you use
local terminal = "alacritty"
local browser = "firefox"
local fileManager = "dolphin"
local menu = "rofi -show drun"
local powermenu = "~/.config/hypr/scripts/wlogout.sh"
local toggleaudio = "~/.config/hypr/scripts/toggle_audio.sh"
local hyprlock = "hyprlock"
local startpanel = "waybar"
local killpanel = "killall waybar"
local calculator = "speedcrunch"

-- My program binds
hl.bind(mainMod .. " + RETURN",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B",          hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N",          hl.dsp.exec_cmd(powermenu))
hl.bind(mainMod .. " + CTRL + X",   hl.dsp.exec_cmd(toggleaudio))
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + C",          hl.dsp.exec_cmd(calculator))
hl.bind(mainMod .. " + SHIFT + L",  hl.dsp.exec_cmd(hyprlock))
hl.bind(mainMod .. " + P",          hl.dsp.exec_cmd(startpanel))
hl.bind(mainMod .. " + SHIFT + P",  hl.dsp.exec_cmd(killpanel))
hl.bind(mainMod .. " + O",          hl.dsp.exec_cmd("obsync"))

-- Other binds
hl.bind(mainMod .. " + SHIFT + M",  hl.dsp.exit())
hl.bind(mainMod .. " + Q",          hl.dsp.window.close())
hl.bind(mainMod .. " + F",          hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + CTRL + P",   hl.dsp.window.pseudo())
hl.bind(mainMod .. " + CTRL + F",   hl.dsp.window.float({ action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",       hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",      hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",         hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",       hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + H",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L",          hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",          hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",          hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1",          hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2",          hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3",          hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4",          hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5",          hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6",          hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7",          hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8",          hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9",          hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0",          hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1",  hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2",  hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3",  hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4",  hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5",  hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6",  hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7",  hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8",  hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9",  hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0",  hl.dsp.window.move({ workspace = 10 }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {
    locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
    locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
    locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
    locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), {
    locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),
    {locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",            hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause",           hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",            hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",            hl.dsp.exec_cmd("playerctl previous"), { locked = true })
