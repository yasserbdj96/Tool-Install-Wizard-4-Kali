#!/bin/bash

# Download the latest version of Visual Studio Code
wget -q https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O /tmp/vscode.deb

# Install Visual Studio Code
sudo dpkg -i /tmp/vscode.deb

# Install any missing dependencies
sudo apt-get install -f

# Cleanup
rm /tmp/vscode.deb

# Start Visual Studio Code
#code
