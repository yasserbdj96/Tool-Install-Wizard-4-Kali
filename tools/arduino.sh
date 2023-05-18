#!/bin/bash

# Download the latest Arduino IDE Nightly build for Linux 64-bit
wget https://downloads.arduino.cc/arduino-ide/nightly/arduino-ide_nightly-latest_Linux_64bit.AppImage

# Make the downloaded file executable
chmod +x arduino-ide_nightly-latest_Linux_64bit.AppImage

# Move the file to a location of your choice (optional)
# For example, to move it to /opt/arduino-ide-nightly:
sudo mv arduino-ide_nightly-latest_Linux_64bit.AppImage /opt/arduino-ide-nightly/

# Create a desktop shortcut for the Arduino IDE Nightly build (optional)
# For example, to create a desktop shortcut for all users:
sudo tee /usr/share/applications/arduino-ide-nightly.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Arduino IDE Nightly
Comment=Development environment for Arduino boards
Exec=/opt/arduino-ide-nightly/arduino-ide_nightly-latest_Linux_64bit.AppImage
Icon=/opt/arduino-ide-nightly/arduino-ide.svg
Terminal=false
Type=Application
Categories=Development;Electronics;
EOF

# Launch the Arduino IDE Nightly build
#./arduino-ide_nightly-latest_Linux_64bit.AppImage
