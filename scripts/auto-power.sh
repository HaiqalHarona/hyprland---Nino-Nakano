#!/usr/bin/env bash

# Auto Power Profile Switcher
# Sets 'performance' when plugged into AC, 'balanced' when on battery

get_ac_online() {
    cat /sys/class/power_supply/AC*/online 2>/dev/null | head -n 1
}

current_state=""

apply_power_profile() {
    online=$(get_ac_online)
    if [ "$online" = "1" ]; then
        if [ "$current_state" != "performance" ]; then
            powerprofilesctl set performance 2>/dev/null
            current_state="performance"
            notify-send -u low -i preferences-system-power "Power Profile" "⚡ Switched to Performance Mode (AC Connected)" 2>/dev/null
        fi
    else
        if [ "$current_state" != "balanced" ]; then
            powerprofilesctl set balanced 2>/dev/null
            current_state="balanced"
            notify-send -u low -i battery "Power Profile" "🔋 Switched to Balanced Mode (On Battery)" 2>/dev/null
        fi
    fi
}

# Initial application
apply_power_profile

# Monitor power events
upower --monitor | while read -r line; do
    case "$line" in
        *line_power*|*battery*|*ACAD*)
            apply_power_profile
            ;;
    esac
done
