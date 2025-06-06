# Home dotfiles

## setting up
### manually
init bare git repo:  
```sh
git init --bare $HOME/.home.git
```
set util home alias:  
```sh
alias home='git --work-tree=$HOME --git-dir=$HOME/.home.git'
```
set remote origin:  
```sh
home remote add origin https://github.com/jfsanchez91/home.git
```
fetch from remote and update:  
```sh
home fetch
home switch master --discard-changes --force
```

### with clone script
```sh
curl -s https://raw.githubusercontent.com/jfsanchez91/home/refs/heads/master/.local/bin/.home_setup/clone.sh | bash
```
this clone script will initialize a bare git repository at $HOME/.home.git and then will fetch from remote.  
NOTE: any conflicting file will be overriden by this operation.  


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

## setting up cursor theme (breese-dark, 24 size)  
```sh
hyprctl setcursor breeze-dark 24
```

