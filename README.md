# Nino Nakano Hyprland Configuration

A performance-oriented Hyprland configuration for Arch Linux using native Lua (`hyprland.lua`), themed around the purple and pink palette of Nino Nakano.

---

## Features

- Native Lua runtime (`hyprland.lua`) with modular configuration.
- Dynamic monitor management: automatic 180Hz external display configuration (`HDMI-A-1`) with laptop screen disable/enable handling.
- Game resource optimization: automatic closing and suspension (`SIGSTOP`) of Eww desktop widgets during gaming or window focus.
- Power profile management: automatic switching between Performance (AC) and Balanced (Battery), plus a Waybar UI toggle.
- GPU-accelerated lockscreen (`hyprlock`) and idle management (`hypridle`).
- Integrated On-Screen Display (`swayosd`) for volume and brightness.
- Lightweight notification daemon (`mako`).
- Themed terminal (`kitty`), prompt (`starship`), and launcher (`rofi`).

---

## Dependencies

### 1. Official Arch Linux Packages
```bash
sudo pacman -S --needed \
  hyprland hyprpaper hyprlock hypridle xdg-desktop-portal-hyprland \
  waybar mako swayosd rofi kitty btop thunar \
  starship fastfetch playerctl socat jq brightnessctl \
  power-profiles-daemon upower wl-clipboard cliphist grim slurp \
  ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji \
  papirus-icon-theme
```

### 2. AUR Package (Eww)
```bash
yay -S eww
# or: paru -S eww
```

### 3. Required Services
```bash
sudo systemctl enable --now power-profiles-daemon.service
sudo systemctl enable --now upower.service
```

---

## Installation

```bash
# Clone repository into ~/.config/hypr
git clone https://github.com/HaiqalHarona/hypr.git ~/.config/hypr

# Make all helper scripts executable
chmod +x ~/.config/hypr/scripts/*.sh ~/.config/eww/scripts/*.sh ~/.config/rofi/powermenu.sh

# Enable Starship prompt in ~/.bashrc (if using bash)
echo 'eval "$(starship init bash)"' >> ~/.bashrc
```

---

## Wallpaper Configuration

Desktop wallpapers are managed by `hyprpaper`, and lockscreen backgrounds are managed by `hyprlock`.

### 1. Wallpaper Location
Place your image file in:
```text
~/Pictures/Wallpapers/
```
Example: `~/Pictures/Wallpapers/wallpaperhypr.jpg`

### 2. Desktop Wallpaper Setup
Edit `~/.config/hypr/hyprpaper.conf`:
```ini
wallpaper {
    monitor = 
    path = /home/<your-username>/Pictures/Wallpapers/wallpaperhypr.jpg
    fit_mode = cover
}

splash = false
ipc = true
```

Reload wallpaper without restarting Hyprland:
```bash
killall hyprpaper && hyprpaper &
```

### 3. Lockscreen Wallpaper Setup
Edit `~/.config/hypr/hyprlock.conf`:
```ini
background {
    monitor =
    path = /home/<your-username>/Pictures/Wallpapers/wallpaperhypr.jpg
    color = rgba(26, 15, 30, 1.0)
    blur_passes = 3
    blur_size = 6
}
```

---

## Monitor and Refresh Rate Setup

Edit `~/.config/hypr/conf/monitors.lua` to match your display outputs:

1. Identify connected displays:
   ```bash
   hyprctl monitors all
   ```
2. Update output names and refresh rates:
   ```lua
   -- External Display
   hl.monitor({
       output   = "HDMI-A-1",
       mode     = "1920x1080@180",
       position = "0x0",
       scale    = 1,
   })

   -- Laptop Internal Screen (disabled when docked)
   hl.monitor({
       output   = "eDP-1",
       disabled = true,
   })
   ```
3. Apply changes:
   ```bash
   hyprctl reload
   ```

---

## Keybindings

Main modifier: `SUPER` (Windows key)

| Keybind | Action |
|---|---|
| `SUPER + Q` | Open terminal (`kitty`) |
| `SUPER + E` | Open file manager (`thunar`) |
| `SUPER + R` | Open application launcher (`rofi`) |
| `SUPER + V` | Open clipboard history (`rofi` + `cliphist`) |
| `SUPER + D` | Toggle desktop widgets (`eww`) |
| `SUPER + L` | Lock screen (`hyprlock`) |
| `SUPER + M` | Open power menu (`rofi`) |
| `SUPER + B` | Open system monitor (`btop`) |
| `SUPER + SHIFT + B` | Restart status bar (`waybar`) |
| `SUPER + C` | Close active window |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + N` | Minimize window silently (`special:minimized`) |
| `SUPER + SHIFT + N` | Toggle minimized windows drawer |
| `SUPER + SHIFT + V` | Toggle floating mode |
| `SUPER + 1` to `0` | Switch to workspace 1–10 |
| `SUPER + SHIFT + 1` to `0` | Move window to workspace 1–10 |
| `Print` | Screenshot to clipboard |
| `SUPER + Print` | Select region to clipboard |
| `SUPER + SHIFT + Print` | Full screenshot to `~/Pictures/Screenshots/` |
| `XF86AudioRaiseVolume` | Volume +5% (SwayOSD HUD) |
| `XF86AudioLowerVolume` | Volume -5% (SwayOSD HUD) |
| `XF86AudioMute` | Toggle audio mute (SwayOSD HUD) |
| `XF86MonBrightnessUp` | Brightness +5% (SwayOSD HUD) |
| `XF86MonBrightnessDown` | Brightness -5% (SwayOSD HUD) |

---

## Gaming Optimizations

- **Direct Scanout / Tearing**: Configured in `conf/settings.lua` (`allow_tearing = true`) and `conf/rules.lua` for reduced input latency on supported displays.
- **GameMode**: Supported via `gamemode`. Add `gamemoderun %command%` to Steam launch options.
- **zram**: Recommended for systems with 16GB RAM to prevent memory pressure drops during gameplay.
