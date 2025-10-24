export GTP_TTY=$(tty)
export EDITOR=nvim
export SUDO_EDITOR=nvim

alias lz='eza --color=always --icons=always --no-user --no-git --no-permissions --no-filesize --no-time --long -a'
alias ls=lz
alias ll='eza --color=always --icons=always --long --git -a -o'
alias l=ll
alias tree='lz --tree -I .git'
alias lg='lazygit '

export BAT_THEME='TwoDark'
alias bat='bat --color=always'
alias vim=nvim
source <(fzf --zsh)

bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

alias home='git --work-tree=$HOME --git-dir=$HOME/.home.git'
alias lazyhome='lazygit --work-tree=$HOME --git-dir=$HOME/.home.git'

# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

export PATH=$PATH:$HOME/.local/bin

alias ff='fzf'

git_current_branch() {
    echo $(git rev-parse --abbrev-ref HEAD)
}

git_default_branch() {
    echo $(git db)
}

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
    git
    archlinux
    pass
)

# load util functions
source ~/.zutils


# load specific host zsh configuration if present
if test -e ~/.zhost; then
    source ~/.zhost
fi

alias loadenv='source $PWD/.local/.activate 2>/dev/null' # dev alias to load local project environment, similar to python virtualenvs
alias sys-update='paru -Syu'

# zoxide (similar to autojump)
eval "$(zoxide init zsh)"

# load daily journal
# Only run in interactive terminals (not in GUI login shells)
if [[ $- == *i* ]] && [[ -t 0 ]]; then
    ~/.local/bin/jrnl_daily.sh
fi

alias j='jrnl '

