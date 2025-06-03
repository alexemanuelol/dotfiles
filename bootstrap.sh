#!/usr/bin/env bash

set -ex

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm ansible

# Base packages
sudo pacman -S --noconfirm base-devel linux-headers xdg-user-dirs

# Nvidia packages
sudo pacman -S --noconfirm nvidia-dkms nvidia-open-dkms nvidia-utils lib32-nvidia-utils nvidia-settings

# Other packages
sudo pacman -S --noconfirm fastfetch wl-clipboard interception-tools interception-caps2esc

# sudo vim /etc/modprobe.d/nvidia.conf -> options nvidia_drm modeset=1
# sudo vim /etc/mkinitcpio.conf -> MODULES=(btrfs i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)
# sudo mkinitcpio -P
# sudo vim /etc/default/grub -> GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau"
#
# TODO: Install
# waybar, hyprland, uwsm, firefox neovim, hyprpaper, ly, rofi, dolphin, htop, qt5ct, qt6ct, qt5-wayland, qt6-wayland,
# ranger, hyprlock, papirus-icon-theme, hyprpicker, hypridle, pavucontrol, network-manager-applet, btop, blueman, bluez,
# bluez-utils, swaync
#
# Enable bluetooth service:
# systemctl enable bluetooth
# systemctl start bluetooth
#
# yay:
# yay -S wlogout
# Dont forget to make wlogout.sh executable
#
# Steps:
#
# Remember applications in dolphin:
# sudo ln -s /etc/xdg/menus/arch-applications.menu /etc/xdg/menus/applications.menu
# cp /usr/share/applications/vim.desktop ~/.local/share/applications/vim.desktop\
# Edit vim.desktop ->
#   Exec=alacritty -e nvim %F
#   Terminal=false
#
# Screensharing:
# sudo pacman -S xdg-desktop-portal-hyprland
#
# Backlight:
# sudo pacman -S brightnessctl
#
# sudo pacman -S xdg-user-dirs
# xdg-user-dirs-update
#
# ly:
#   sudo pacman -S ly
#   sudo systemctl enable ly.service
#   sudo systemctl start ly.service
#
# Caps -> esc:
#   sudo pacman -S interception-tools interception-caps2esc
#
# Install audio drivers:
#   sudo pacman -S pipewire pipewire-audio pipewire-pulse pipewire-alsa wireplumber
#
# Enable & start:
#   systemctl --user enable pipewire
#   systemctl --user start pipewire
#   systemctl --user enable wireplumber
#   systemctl --user start wireplumber
