#!/bin/bash

# Stop Telegram if it's running
if pgrep telegram-desktop >/dev/null 2>&1 ; then
    echo "Stopping Telegram"
    pkill telegram-desktop
fi

# Download Telegram deb package
wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux

# Extract the package
tar -xvf telegram.tar.xz

# Install dependencies
sudo apt-get update
sudo apt-get install libgtk-3-0 libnotify4 libnss3 xdg-utils libxss1 libxtst6 -y

# Install Telegram
sudo mv Telegram /opt/
sudo ln -sf /opt/Telegram/Telegram /usr/bin/telegram-desktop

# Clear Telegram data
rm -rf ~/.local/share/TelegramDesktop

# Clean up
rm telegram.tar.xz

echo "Telegram has been installed and data cleared successfully!"

./opt/Telegram/Telegram
