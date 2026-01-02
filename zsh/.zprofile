export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QUICK_CONTROLS_STYLE=org.kde.desktop
export KDE_COLOR_SCHEME=BreezeDark
#export QT_STYLE_OVERRIDE=kvantum

[ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && exec start-hyprland
