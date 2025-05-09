# Home dotfiles

## setting up
clone this repository into user $HOME
```sh
git clone git@github.com:jfsanchez91/home.git $HOME && cd $HOME
```

## arch setup
execute arch home setup script
```sh
./.local/bin/.home_setup/arch.sh
```

## home alias
in the ~/.zprofile config there is a new alias for Git to handle the $HOME configs.
```sh
alias home='git --work-tree=$HOME --git-dir=$HOME/.home.git'
```
once this alias is in place, we can handle the $HOME config using the `home` command, e.g:
- home status
- home tree
- home add .
- home commit -m "New config file"
- home push

