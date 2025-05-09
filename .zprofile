export GTP_TTY=$(tty)
export EDITOR=nvim
export SUDO_EDITOR=nvim

alias lz='eza --color=always --icons=always --no-user --no-git --no-permissions --no-filesize --no-time --long -a'
alias ls=lz
alias ll='eza --color=always --icons=always --long --git -a -o'
alias l=ll
alias tree='lz --tree -I .git'

export BAT_THEME='TwoDark'
alias cat='bat --color=always'
alias vim=nvim
source <(fzf --zsh)

bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

alias home='git --work-tree=$HOME --git-dir=$HOME/.home.git'

# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# autojump
source /usr/share/autojump/autojump.zsh

export PATH=$PATH:$HOME/.local/bin

