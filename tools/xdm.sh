#!/bin/bash
LATEST_VERSION=$(curl -s "https://api.github.com/repos/subhra74/xdm/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
wget https://github.com/subhra74/xdm/releases/download/$LATEST_VERSION/xdm-setup-$LATEST_VERSION.tar.xz
tar -xvf xdm-setup-$LATEST_VERSION.tar.xz
#cd xdm-$LATEST_VERSION
#chmod +x ./install.sh
sudo ./install.sh
rm ./install.sh
rm readme.txt
rm xdm-setup-$LATEST_VERSION.tar.xz
