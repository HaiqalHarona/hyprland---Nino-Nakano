-- Nino Nakano Theme Colors
-- Centralized palette — require this first in hyprland.lua
-- Reference these in other modules via the global `theme` table

theme = {
    primary         = "rgba(a54a96ee)",   -- Official Nino purple
    secondary       = "rgba(f06fa0ee)",   -- Shocking pink (hair)
    accent          = "rgba(c03080ee)",   -- Deep magenta (bow)
    bg              = "rgba(1a0f1edd)",   -- Near-black purple
    surface         = "rgba(2a1f2edd)",   -- Dark purple-grey
    text            = "#f0e6f0",          -- Soft white
    inactive        = "rgba(6b4a6eaa)",   -- Muted purple-grey
    border_active   = { colors = {"rgba(f06fa0ee)", "rgba(a54a96ee)"}, angle = 45 },
    border_inactive = "rgba(6b4a6eaa)",
}
