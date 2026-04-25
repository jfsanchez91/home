#!/bin/bash
set -e

echo "Installing base CLI packages"
sudo pacman -Su --noconfirm --needed curl git zip unzip base-devel zsh git

# =========================
# yay (AUR helper)
# =========================
if ! command -v yay >/dev/null 2>&1; then
  echo "Setting up yay"
  (
    cd /tmp/
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm
  )
fi

yay --version

# =========================
# CLI / TUI environment only
# =========================
echo "Installing CLI/TUI environment"

yay -Su --noconfirm --needed \
  zellij \
  lazygit \
  neovim \
  ripgrep \
  fzf \
  bat \
  eza \
  zoxide \
  jq \
  git-delta \
  uv \
  curl \
  wget \
  openssh \
  rsync \
  less \
  man-db \
  man-pages \
  tree \
  htop \
  btop \
  gnupg \
  starship \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  bash-completion

# =========================
# Shell setup
# =========================
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting zsh as default shell"
  chsh -s "$(which zsh)"
fi

# =========================
# Oh My Zsh
# =========================
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# =========================
# Powerlevel10k (optional CLI theme)
# =========================
PW10K_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$PW10K_PATH" ]; then
  echo "Installing powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$PW10K_PATH"
fi

# =========================
# Neovim config
# =========================
NVIM_HOME="$HOME/.config/nvim"
if [ ! -d "$NVIM_HOME" ]; then
  echo "Installing Neovim config (LazyVim)"
  git clone https://github.com/LazyVim/starter $NVIM_HOME
fi

# =========================
# Keyd (CLI only, optional)
# =========================
KEYD_CONFIG_FILE=/etc/keyd/default.conf
if [ ! -f "$KEYD_CONFIG_FILE" ]; then
  echo "Setting up KeyD config symlink"
  sudo mkdir -p /etc/keyd
  sudo ln -sf "$HOME/.config/keyd/default.conf" "$KEYD_CONFIG_FILE"
fi

# =========================
# CLI tools via uv
# =========================
echo "Installing uv CLI tools"
uv tool install jrnl

echo "Done: CLI/TUI environment ready"
