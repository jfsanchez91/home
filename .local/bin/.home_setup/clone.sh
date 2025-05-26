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
$home switch master --discard-changes --force
echo "Done"

