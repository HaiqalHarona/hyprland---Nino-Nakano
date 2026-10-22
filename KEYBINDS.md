# Keybinds Reference

> **Main modifier:** `SUPER` (Windows key)

---

## Applications

| Keybind | Action |
|---|---|
| `SUPER + Q` | Open terminal (kitty) |
| `SUPER + E` | Open file manager (thunar) |
| `SUPER + R` | Open app launcher (rofi) |
| `SUPER + B` | Open system monitor (btop) |
| `SUPER + SHIFT + B` | Restart top bar (waybar) |
| `SUPER + D` | Toggle desktop widgets (dashboard & media player) |
| `SUPER + L` | Lock screen (hyprlock) |
| `SUPER + M` | Open power menu (rofi) |

---

## Window Management

| Keybind | Action |
|---|---|
| `SUPER + C` | Close focused window |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + N` | **Minimize active window** (hides to background) |
| `SUPER + SHIFT + N` | **Restore / Toggle minimized windows** |
| `SUPER + SHIFT + V` | Toggle floating |
| `SUPER + P` | Toggle pseudo tile |
| `SUPER + J` | Toggle split (dwindle layout) |

---

## Focus & Window Movement

| Keybind | Action |
|---|---|
| `SUPER + ← ↑ ↓ →` | Focus window in direction |
| `SUPER + SHIFT + ← ↑ ↓ →` | Move window in layout |
| `SUPER + LMB (drag)` | Move floating window |
| `SUPER + RMB (drag)` | Resize window |

---

## Workspaces & Scratchpad

| Keybind | Action |
|---|---|
| `SUPER + 1` → `SUPER + 0` | Switch to workspace 1–10 |
| `SUPER + SHIFT + 1` → `SUPER + SHIFT + 0` | Move window to workspace 1–10 |
| `SUPER + Scroll Up / Down` | Next / Previous workspace |
| `SUPER + S` | Toggle special scratchpad |
| `SUPER + SHIFT + S` | Move active window to scratchpad |
| `SUPER + N` | Minimize active window silently (`special:minimized`) |
| `SUPER + SHIFT + N` | Toggle minimized windows drawer |

---

## Display & Gaming Performance

- **Main Monitor**: `HDMI-A-1` runs at native **1080p @ 180Hz**. Laptop internal screen (`eDP-1`) is turned off when docked and automatically wakes back up if HDMI is disconnected.
- **Game Optimization (Auto-Pause)**: Desktop widgets (Eww) automatically close and freeze background processes when switching away from Workspace 1, focusing windows, or playing fullscreen games.
- **Power Profiles**: Automatically switches to **Performance** when AC charger is plugged in and **Balanced** when on battery. You can also left-click the power profile icon in Waybar anytime to cycle profiles manually.


---

## Screenshots

| Keybind | Action |
|---|---|
| `Print` | **Full screenshot → Clipboard** |
| `SUPER + Print` | **Region screenshot → Clipboard** |
| `SUPER + SHIFT + Print` | **Full screenshot → `~/Pictures/Screenshots/`** |
| `Ctrl + Print` | **Region screenshot → `~/Pictures/Screenshots/`** |

---

## Clipboard

| Keybind | Action |
|---|---|
| `SUPER + V` | Open clipboard manager (rofi) |

---

## Media & Hardware Keys (with SwayOSD HUD)

| Keybind | Action |
|---|---|
| `XF86AudioRaiseVolume` | Volume +5% (with OSD feedback) |
| `XF86AudioLowerVolume` | Volume −5% (with OSD feedback) |
| `XF86AudioMute` | Toggle audio mute (with OSD feedback) |
| `XF86AudioMicMute` | Toggle microphone mute (with OSD feedback) |
| `XF86MonBrightnessUp` | Brightness +5% (with OSD feedback) |
| `XF86MonBrightnessDown` | Brightness −5% (with OSD feedback) |
| `Caps_Lock` | Toggle CapsLock (with OSD feedback) |
| `XF86AudioNext / Prev` | Next / Previous track |
| `XF86AudioPlay / Pause` | Play / Pause media |
