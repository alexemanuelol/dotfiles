#!/usr/bin/env bash

set -ex

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm ansible

# Base packages
sudo pacman -S --noconfirm base-devel linux-headers xdg-user-dirs

# Nvidia packages
sudo pacman -S --noconfirm nvidia-dkms nvidia-open-dkms nvidia-utils lib32-nvidia-utils nvidia-settings

# Other packages
sudo pacman -S --noconfirm neofetch

# sudo vim /etc/modprobe.d/nvidia.conf -> options nvidia_drm modeset=1
# sudo vim /etc/mkinitcpio.conf -> MODULES=(btrfs i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)
# sudo mkinitcpio -P
# sudo vim /etc/default/grub -> GRUB_CMDLINE_LINUX="nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau"
#
# TODO: Install
# kitty, waybar, hyprland, uwsm, firefox neovim
