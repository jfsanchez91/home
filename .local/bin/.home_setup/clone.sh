#!/bin/bash

echo "Setting up home clone"
git init --bare $HOME/.home.git
home="git --work-tree $HOME --git-dir=$HOME/.home.git"
$home remote add origin git@github.com:jfsanchez91/home.git
$home fetch origin
$home clean -fd
$home checkout -b master --track origin/master
$home reset origin/master
echo "Done"
