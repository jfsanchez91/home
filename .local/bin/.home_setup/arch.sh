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
	otf-font-awesome \
	lazygit

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
	firefox \
	firefox-profile-launcher \
	kolourpaint \
	neovim \
	ripgrep \
	keyd \
	jq

if [ $SHELL != "/usr/bin/zsh" ]; then
	echo "Setting up zsh as default shell"
	chsh $(which zsh)
fi

echo "Remove no longer needed packages"
sudo pm -Rns --noconfirm kitty dolphin

if [ "$ZSH" != "$HOME/.oh-my-zsh" ]; then
	echo "Installing ohmyzsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

PW10K_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d $PW10K_PATH ]; then
	echo "Installing powerlevel10k"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PW10K_PATH
fi

NVIM_HOME="$HOME/.config/nvim"
if [ ! -d $NVIM_HOME ]; then
	echo "Setting up Neovim config at $NVIM_HOME"
	git clone --depth=1 https://github.com/jfsanchez91/kickstart.nvim.git $NVIM_HOME
fi

KEYD_CONFIG_FILE=/etc/keyd/default.conf
if [ ! -f $KEYD_CONFIG_FILE ]; then
	echo "Setting up KeyD config"
	sudo ln -s $HOME/.config/keyd/default.conf $KEYD_CONFIG_FILE
fi

