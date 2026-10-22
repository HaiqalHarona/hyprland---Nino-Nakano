local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- Make Thunar translucent
hl.window_rule({
    name    = "thunar-translucent",
    match   = { class = "[tT]hunar" },
    opacity = "0.88 0.80",
})

-- Float Bluetooth manager window
hl.window_rule({
    name  = "float-blueman",
    match = { class = "blueman-manager" },
    float = true,
})

-- Desktop btop widget
hl.window_rule({
    name    = "desktop-btop-widget",
    match   = { class = "btop-widget" },
    float   = true,
    size    = "820 620",
    move    = "24 50",
    opacity = "0.90 0.85",
})

-- Gaming Optimizations: Direct scanout & low-latency tearing
hl.window_rule({
    name      = "gaming-direct-scanout",
    match     = { class = "^(steam_app_.*|gamescope|cs2|dota2|osu!|lutris|heroic|.*[Ww]arframe.*)$" },
    immediate = true,
})
