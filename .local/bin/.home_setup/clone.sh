#!/bin/bash

echo "Setting up home clone"
git init --bare $HOME/.home.git
home="git --work-tree $HOME --git-dir=$HOME/.home.git"
$home remote add origin https://github.com/jfsanchez91/home.git
$home fetch origin
$home checkout -b master --track origin/master --merge
if [ $? -ne 0 ]; then
    echo "Conflicts detected. Removing conflicting files..."
    $home status --porcelain | grep '^UU' | awk '{print $2}' | xargs rm -f
    $home checkout --ours .
    $home reset origin/master
fi
echo "Done"

