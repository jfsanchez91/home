#!/bin/bash

echo "Making pm link for pacman"
sudo ln -s /usr/bin/pacman /usr/bin/pm

echo "Installing base packages"
sudo pm -Su --noconfirm --needed curl git zsh zip unzip otf-font-awasome ttf-noto-nerd base-devel blueman wl-clipboard cliphist hyprpaper hyprlock bat networkmanager network-manager-applet ghostty hyprland jq

echo "Settring up zsh as default shell"
chsh $(which zsh)

echo "Remove no longer needed packages"
sudo pm -Rns --noconfirm kitty

# setup paru
echo "Setting up paru"
(cd /tmp/ \
	&& git clone https://aur.archlinux.org/paru.gi \
	&& cd paru \
	&& makepkg -si \
	&& paru --version \
)

# paru install
echo "Installing extra packages (paru)"
paru -Su --noconfirm --needed wlogout avizo visual-studio-code-bin

echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"


echo "Installing SDKMan"
curl -s "https://get.sdkman.io" | bash

