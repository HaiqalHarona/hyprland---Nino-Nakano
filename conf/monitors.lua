-- External Monitor (Primary 1080p @ 180Hz)
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@180",
    position = "0x0",
    scale    = 1,
})

-- Internal Laptop Display (Disabled when external monitor is connected)
hl.monitor({
    output   = "eDP-1",
    disabled = true,
})

-- Fallback for portable use or other displays
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- Dynamic Hotplug: Re-enable laptop screen if HDMI is unplugged
hl.on("monitor.removed", function (data)
    if data and (data.name == "HDMI-A-1" or data == "HDMI-A-1") then
        hl.monitor({
            output   = "eDP-1",
            mode     = "1920x1080@60",
            position = "0x0",
            scale    = 1.5,
            disabled = false,
        })
    end
end)

hl.on("monitor.added", function (data)
    if data and (data.name == "HDMI-A-1" or data == "HDMI-A-1") then
        hl.monitor({
            output   = "HDMI-A-1",
            mode     = "1920x1080@180",
            position = "0x0",
            scale    = 1,
        })
        hl.monitor({
            output   = "eDP-1",
            disabled = true,
        })
    end
end)
