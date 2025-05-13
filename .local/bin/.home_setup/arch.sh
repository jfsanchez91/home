#!/bin/bash

echo "Installing base packages"
sudo pacman -Su --noconfirm --needed curl git zip unzip base-devel

if ! command -v paru 2>&1 > /dev/null; then
	echo "Setting up paru"
	(cd /tmp/ \
		&& git clone https://aur.archlinux.org/paru.git \
		&& cd paru \
		&& makepkg -si
	)
fi
paru --version

echo "Installing hyprland env"
paru -Su --noconfirm --needed \
	zsh \
	ghostty \
	zellij \
	hyprland \
	waybar \
	hyprlock \
	hyprshot \
	pavucontrol \
	wofi \
	hyprpaper \
	otf-font-awesome 

paru -Su --noconfirm --needed \
	otf-font-awesome \
	blueman \
	wl-clipboard \
	bat \
	cliphist \
	networkmanager \
	network-manager-applet \
	fzf \
	ttf-jetbrains-mono-nerd \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	wlogout \
	avizo \
	autojump \
	breeze \
	breeze-icons \
	adwaita-dark \
	kvantum \
	qt6ct \
	lxappearance-gtk3 \
	adw-gtk-theme \
	eza \
	imv \
	xfce4-taskmanager \
	thunar \
	jq

echo "Setting up zsh as default shell"
chsh $(which zsh)

echo "Remove no longer needed packages"
sudo pm -Rns --noconfirm kitty dolphin

echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#echo "Installing powerlevel10k"
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

