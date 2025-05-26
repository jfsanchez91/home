#!/bin/bash

if ! command -v sdk 2>&1 > /dev/null; then
	echo "Installing SDKMan"
	curl -s "https://get.sdkman.io" | bash
fi

if ! command -v docker 2>&1 > /dev/null; then
	NEED_DOCKER=false
else
	NEED_DOCKER=true
fi

echo "Installing dev packages"
paru -Su --noconfirm --needed \
	jetbrains-toolbox \
	microsoft-edge-stable-bin \
	visual-studio-code-bin \
	docker \
	docker-compose

if [ $NEED_DOCKER = "true" ]; then
	echo "Setting up docker"
	sudo usermod -a -G docker $USER
	newgrp docker
fi
