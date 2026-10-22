local mainMod = "SUPER"
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun -theme ~/.config/rofi/nino.rasi"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("~/.config/rofi/powermenu.sh"))                           -- Rofi Power Menu
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))                                              -- Lock screen
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))  -- Float toggle (moved to free V)
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())                           -- Fullscreen toggle
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("kitty --class btop-widget -o font_size=10.5 -o window_padding_width=4 -e btop"))     -- Open btop monitor
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("killall waybar; waybar"))                                                                -- Restart Waybar
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("eww open --toggle dashboard && eww open --toggle media_player"))          -- Toggle desktop eww dashboard

-- Focus with arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows in layout with SUPER + SHIFT + arrows
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad & minimize)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + N",         hl.dsp.window.move({ workspace = "special:minimized", silent = true }))       -- Minimize active window
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.workspace.toggle_special("minimized"))                               -- Toggle/restore minimized windows

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),      { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("swayosd-client --brightness raise"),         { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("swayosd-client --brightness lower"),         { locked = true, repeating = true })
hl.bind("Caps_Lock",            hl.dsp.exec_cmd("swayosd-client --caps-lock"),                { locked = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshot (requires grim + slurp + wl-clipboard)
hl.bind("Print",                       hl.dsp.exec_cmd("grim - | wl-copy"))                                             -- Full screenshot to clipboard
hl.bind(mainMod .. " + Print",         hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))                             -- Region screenshot to clipboard
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/$(date +%s).png"))                 -- Full screenshot to ~/Pictures/Screenshots/
hl.bind("CTRL + Print",                hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%s).png"))  -- Region screenshot to ~/Pictures/Screenshots/

-- Clipboard picker (requires wl-clipboard + cliphist + rofi)
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -theme ~/.config/rofi/clipboard.rasi -p '󰅍 Clipboard' | cliphist decode | wl-copy"))
