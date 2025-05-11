#!/bin/bash

echo "Installing SDKMan"
curl -s "https://get.sdkman.io" | bash

echo "Installing"
paru -Su --noconfirm --needed \
	jetbrains-toolbox \
	microsoft-edge-stable-bin \
	visual-studio-code-bin \
	docker \
	docker-compose

echo "Setting up docker"
sudo usermod -a -G docker $USER
newgrp docker

