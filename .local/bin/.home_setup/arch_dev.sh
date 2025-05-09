#!/bin/bash

echo "Installing SDKMan"
curl -s "https://get.sdkman.io" | bash

echo "Installing JetBrains ToolBox"
paru -Su --noconfirm jetbrains-toolbox microsoft-edge-stable-bin
