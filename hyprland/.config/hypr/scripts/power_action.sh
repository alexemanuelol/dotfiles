#!/bin/bash

# Get charging status
AC_PATH="/sys/class/power_supply/AC/online"
CHARGING=0

if [ -f "$AC_PATH" ]; then
    CHARGING=$(cat "$AC_PATH")
fi

ACTION="$1"

if [ "$CHARGING" -eq 0 ]; then
    case "$ACTION" in
        dpms-off)
            hyprctl dispatch dpms off
            ;;
        suspend)
            systemctl suspend
            ;;
    esac
fi
