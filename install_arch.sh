#!/bin/bash

# Arch Linux Dotfiles Installation Script

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/.dotfiles"

# Packages

ESSENTIAL_PACKAGES=(
# {{{
    "base"
    "base-devel"
    "curl"
    "git"
    "linux-headers"
    "networkmanager"
    "stow"
    "unzip"
    "wget"
)
# }}}

NVIDIA_PACKAGES=(
# {{{
    "egl-wayland"
    "lib32-nvidia-utils"
    "nvidia-dkms"
    "nvidia-settings"
    "nvidia-utils"
)
# }}}

OTHER_PACKAGES=(
# {{{
    "alacritty"
    "archlinux-xdg-menu"
    "blueman"
    "bluez"
    "bluez-utils"
    "brightnessctl"
    "btop"
    "discord"
    "dolphin"
    "fastfetch"
    "firefox"
    "gimp"
    "hypridle"
    "hyprland"
    "hyprlock"
    "hyprpaper"
    "hyprpicker"
    "kvantum"
    "ly"
    "neovim"
    "network-manager-applet"
    "openssl"
    "papirus-icon-theme"
    "pavucontrol"
    "pipewire"
    "pipewire-alsa"
    "pipewire-audio"
    "pipewire-pulse"
    "python-pip"
    "qt5-wayland"
    "qt5ct"
    "qt6-wayland"
    "qt6ct"
    "ranger"
    "rofi"
    "swaync"
    "tk"
    "vlc"
    "waybar"
    "wireplumber"
    "wl-clipboard"
    "xdg-desktop-portal-hyprland"
    "xdg-user-dirs"
    "xz"
    "yamllint"
    "zlib"
    "zsh"
)
# }}}

AUR_PACKAGES=(
# {{{
    "qimgv-git"
    "spotify"
    "wlogout"
)
# }}}

# Dotfiles

DOTFILE_CONFIGS=(
# {{{
    "Dolphin"
    "Kvantum"
    "alacritty"
    "btop"
    "fastfetch"
    "git"
    "hyprland"
    "nvim"
    "qt5ct"
    "qt6ct"
    "rofi"
    "shell_common"
    "waybar"
    "wlogout"
    "zsh"
    #"ly"
    #"vim"
    #"vscode"
    #"wterminal"
)
# }}}

# Fonts

FONTS_TO_INSTALL=(
# {{{
    "JetBrainsMono:v3.4.0:JetBrainsMonoNerdFont-Regular.ttf"
)
# }}}

# zsh plugins

ZSH_PLUGINS=(
# {{{
    "zsh-autosuggestions:https://github.com/zsh-users/zsh-autosuggestions.git"
    "zsh-syntax-highlighting:https://github.com/zsh-users/zsh-syntax-highlighting.git"
)
# }}}

log() {
# {{{
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}
# }}}

warn() {
# {{{
    echo -e "${YELLOW}[$(date +'%Y-%m-%d %H:%M:%S')] [WARNING] $1${NC}"
}
# }}}

error() {
# {{{
    echo -e "${RED}[$(date +'%Y-%m-%d %H:%M:%S')] [ERROR] $1${NC}"
    exit 1
}
# }}}

info() {
# {{{
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')] [INFO] $1${NC}"
}
# }}}


check_root_and_sudo() {
# {{{
    if [[ $EUID -eq 0 ]]; then
        error "This script should not be run as root! Run as normal user with sudo access."
    fi

    # Check if user has sudo access
    if ! sudo -n true 2>/dev/null; then
        info "This script requires sudo access for package installation."
        info "You may be prompted for your password during execution."
        sudo -v || error "Sudo access required but not available"
    fi
}
# }}}

update_system() {
# {{{
    log "Updating system packages..."
    sudo pacman -Syu --noconfirm || error "Failed to update system"
}
# }}}

install_packages() {
# {{{
    local array_name="$1"
    local -n packages="$array_name"

    log "Installing packages from array: $array_name"

    for package in "${packages[@]}"; do
        if ! pacman -Qq "$package" >/dev/null 2>&1; then
            sudo pacman -S --noconfirm "$package" || error "Failed to install $package"
        else
            info "$package is already installed"
        fi
    done
}
# }}}

install_aur_helper_yay() {
# {{{
    if ! command -v yay >/dev/null 2>&1; then
        log "Installing yay AUR helper..."
        cd /tmp
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ~
        rm -rf /tmp/yay
    else
        info "yay is already installed"
    fi
}
# }}}

install_aur_packages() {
# {{{
    local array_name="$1"
    local -n packages="$array_name"

    log "Installing AUR packages from array: $array_name"

    for package in "${packages[@]}"; do
        if ! pacman -Qq "$package" >/dev/null 2>&1; then
            yay -S --noconfirm "$package" || error "Failed to install AUR package $package"
        else
            info "AUR package $package is already installed"
        fi
    done
}
# }}}

stow_dotfiles() {
# {{{
    log "Stowing dotfiles..."
    for module in "${DOTFILE_CONFIGS_TEST[@]}"; do
        stow --dir="$DOTFILES_DIR" --target="$HOME" "$module" || error "Failed to stow $module"
        info "Stowed $module"
    done
}
# }}}

unstow_dotfiles() {
# {{{
    log "Stowing dotfiles..."
    for module in "${DOTFILE_CONFIGS_TEST[@]}"; do
        stow -D --dir="$DOTFILES_DIR" --target="$HOME" "$module" || error "Failed to unstow $module"
        info "Unstowed $module"
    done
}
# }}}

install_nerd_font() {
# {{{
    local font_name="$1"
    local font_version="$2"
    local check_file="$3"

    local fonts_dir="$HOME/.local/share/fonts"
    local zip_file="${font_name}.zip"
    local download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/${font_version}/${zip_file}"

    if [[ -f "$fonts_dir/$check_file" ]]; then
        info "Font $check_file is already installed in $fonts_dir"
        return
    fi

    log "Installing Nerd Font: $font_name..."

    mkdir -p "$fonts_dir"

    curl -L "$download_url" -o "/tmp/$zip_file" || error "Failed to download $font_name"

    unzip -o "/tmp/$zip_file" -d "$fonts_dir" || error "Failed to extract $zip_file"
    rm "/tmp/$zip_file"

    fc-cache -fv || error "Failed to rebuild font cache"

    log "Font $font_name installed successfully!"
}
# }}}

install_oh_my_zsh_and_plugins() {
# {{{
    local oh_my_zsh_dir="$HOME/.oh-my-zsh"
    local installer_url="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
    local tmp_dir

    # Check if Oh My Zsh is already installed
    if [[ -d "$oh_my_zsh_dir" ]]; then
        info "Oh My Zsh already installed at $oh_my_zsh_dir"
    else
        log "Installing Oh My Zsh..."

        # Create a temporary directory
        tmp_dir=$(mktemp -d -t ohmyzsh-XXXXXX)

        # Download and run the Oh My Zsh installer
        curl -fsSL "$installer_url" -o "$tmp_dir/install.sh" || {
            error "Failed to download Oh My Zsh installer"
        }

        # Run the installer
        sh "$tmp_dir/install.sh" --unattended --keep-zshrc || {
            error "Oh My Zsh installation failed"
        }

        # Clean up
        rm -rf "$tmp_dir"
        info "Oh My Zsh installed successfully"
    fi

    # Install plugins
    for entry in "${ZSH_PLUGINS[@]}"; do
        local name url
        IFS=':' read -r name url <<< "$entry"
        local plugin_dir="$oh_my_zsh_dir/custom/plugins/$name"

        if [[ -d "$plugin_dir" ]]; then
            info "Plugin '$name' already installed"
        else
            git clone --depth=1 "$url" "$plugin_dir" || warn "Failed to clone $name"
            info "Installed plugin: $name"
        fi
    done
}
# }}}

set_default_shell_to_zsh() {
# {{{
    if [[ "$SHELL" == *zsh ]]; then
        info "Zsh is already the default shell."
    elif command -v zsh >/dev/null 2>&1; then
        log "Changing default shell to zsh..."
        if chsh -s "$(command -v zsh)"; then
            info "Default shell changed to zsh"
        else
            warn "Failed to change default shell to zsh"
        fi
    else
        error "zsh is not installed"
    fi
}
# }}}

enable_services() {
# {{{
    log "Enable service: ly"
    sudo systemctl enable ly.service

    log "Enable service: pipewire"
    systemctl --user enable pipewire.service

    log "Enable service: wireplumber"
    systemctl --user enable wireplumber.service

    log "Enable service: bluetooth"
    systemctl enable bluetooth.service

    log "Enable service: NetworkManager"
    systemctl enable NetworkManager.service
}
# }}}

post_install() {
    log "Running post-installation tasks..."

    chmod +x "$DOTFILES_DIR/hyprland/.config/hypr/scripts/power_action.sh"
    chmod +x "$DOTFILES_DIR/hyprland/.config/hypr/scripts/wlogout.sh"

    # Add 'options nvidia_drm modeset=1' to /etc/modprobe.d/nvidia.conf if not present
    local modprobe_file="/etc/modprobe.d/nvidia.conf"
    local option_line="options nvidia_drm modeset=1"

    if ! grep -Fxq "$option_line" "$modprobe_file" 2>/dev/null; then
        echo "$option_line" | sudo tee -a "$modprobe_file"
        info "Added '$option_line' to $modprobe_file"
    else
        info "'$option_line' already present in $modprobe_file"
    fi

    # Update MODULES in /etc/mkinitcpio.conf
    local mkinitcpio_file="/etc/mkinitcpio.conf"
    local desired_modules="MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)"

    # Check if MODULES line is already correct
    if ! grep -Fxq "$desired_modules" "$mkinitcpio_file"; then
        # Replace existing MODULES line or add if missing
        if grep -q "^MODULES=" "$mkinitcpio_file"; then
            sudo sed -i "s|^MODULES=.*|$desired_modules|" "$mkinitcpio_file"
            info "Replaced MODULES line in $mkinitcpio_file"
        else
            echo "$desired_modules" | sudo tee -a "$mkinitcpio_file"
            info "Added MODULES line to $mkinitcpio_file"
        fi

        # Regenerate initramfs
        sudo mkinitcpio -P && info "Regenerated initramfs"
    else
        info "MODULES line already set correctly in $mkinitcpio_file"
    fi



}

main() {
    info "Starting Arch Linux dotfiles installation..."

    check_root_and_sudo
    update_system
    install_packages ESSENTIAL_PACKAGES
    install_packages NVIDIA_PACKAGES
    install_packages OTHER_PACKAGES
    install_aur_helper_yay
    install_aur_packages AUR_PACKAGES
    stow_dotfiles
    #unstow_dotfiles

    for font_info in "${FONTS_TO_INSTALL[@]}"; do
        IFS=':' read -r name version file <<< "$font_info"
        install_nerd_font "$name" "$version" "$file"
    done

    install_oh_my_zsh_and_plugins
    set_default_shell_to_zsh

    # post install
    xdg-user-dirs-update
    enable_services
    post_install

    log "All done!"
}

main "$@"
