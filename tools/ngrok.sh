#!/bin/bash

# Download the latest version of ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

# Unzip the downloaded file
unzip ngrok-stable-linux-amd64.zip

# Move the ngrok binary to /usr/local/bin
sudo mv ngrok /usr/local/bin/

# Download the ngrok icon
wget https://ngrok.com/static/img/ngrok-white.svg -O ngrok.svg

# Move the ngrok icon to /usr/local/bin
sudo mv ngrok.svg /usr/local/bin/

# Create a .desktop file to add ngrok to the tools menu
sudo touch /usr/share/applications/ngrok.desktop
sudo chmod 644 /usr/share/applications/ngrok.desktop

# Add the following content to the .desktop file
echo "[Desktop Entry]
Encoding=UTF-8
Name=Ngrok
Comment=Secure introspectable tunnels to localhost
Exec=sh -c '/usr/local/bin/ngrok;${SHELL:-bash}'
Icon=/usr/local/bin/ngrok.svg
Terminal=true
Type=Application
Categories=Network;Internet;" | sudo tee -a /usr/share/applications/ngrok.desktop > /dev/null

rm ngrok-stable-linux-amd64.zip