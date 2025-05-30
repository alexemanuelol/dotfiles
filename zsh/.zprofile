export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=kvantum

[ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && exec Hyprland
