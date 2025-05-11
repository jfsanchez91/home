#!/bin/bash

echo "Setting up home clone"

# Check if .home.git already exists
if [ ! -d "$HOME/.home.git" ]; then
    echo "Initialize bare git repository"
    git init --bare "$HOME/.home.git"
fi


echo "Define git command with home work-tree and git-dir"
home="git --work-tree=$HOME --git-dir=$HOME/.home.git"

echo "Add remote and fetch"
$home remote add origin https://github.com/jfsanchez91/home.git
$home fetch origin

echo "Try to checkout master, force overwrite any existing files"
if ! $home checkout -f master --track origin/master; then
    echo "Conflicts detected. Forcing update..."
    echo "Remove any conflicting files"
    $home status --porcelain | grep '^UU' | awk '{print $2}' | xargs -r rm -f
    echo "Force checkout of remote files"
    $home checkout -f master
    echo "Reset to match origin/master"
    $home reset --hard origin/master
fi
echo "Done"

