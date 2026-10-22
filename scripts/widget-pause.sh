#!/usr/bin/env bash

# Automatic Desktop Widget Pause/Resume Daemon
# Saves 100% resources for games and active applications

widgets_open=0

pause_widgets() {
    if [ "$widgets_open" -eq 1 ]; then
        eww close dashboard 2>/dev/null
        eww close media_player 2>/dev/null
        pkill -STOP -f "media.sh" 2>/dev/null
        widgets_open=0
    fi
}

resume_widgets() {
    if [ "$widgets_open" -eq 0 ]; then
        pkill -CONT -f "media.sh" 2>/dev/null
        eww open dashboard 2>/dev/null
        eww open media_player 2>/dev/null
        widgets_open=1
    fi
}

check_state() {
    active_ws=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.id // empty' 2>/dev/null)
    has_fs=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.hasfullscreen // false' 2>/dev/null)
    windows_count=$(hyprctl activeworkspace -j 2>/dev/null | jq -r '.windows // 0' 2>/dev/null)

    # Pause if not on workspace 1, if any window is open on the workspace, or if fullscreen
    if [ "$active_ws" != "1" ] || [ "$has_fs" = "true" ] || [ "$windows_count" -gt 0 ]; then
        pause_widgets
    else
        resume_widgets
    fi
}

# Initial state check
check_state

# Listen to Hyprland IPC socket events
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
    case "$line" in
        workspace*|fullscreen*|openwindow*|closewindow*|focusedmon*)
            check_state
            ;;
    esac
done
