#!/bin/bash

appname="xampp"
APPNAME="Xampp"
zipfile="xampp-linux-x64-8.2.0-0-installer.run"
url="https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.0/xampp-linux-x64-8.2.0-0-installer.run"

# Download XAMPP installer if not already downloaded
download () {
    if [ ! -f "./$zipfile" ] ; then
        wget "$url"
    fi
    chmod +x "$zipfile"
    sudo "./$zipfile"
}

# Install XAMPP
download

# Create desktop launcher
desktop_file="/usr/share/applications/$appname.desktop"
if [ ! -f "$desktop_file" ] ; then
    echo "[Desktop Entry]
Name=$APPNAME
GenericName=$APPNAME
Exec=/usr/local/bin/xampp
#Icon=/opt/lampp/xampp.png
Type=Application
Terminal=false
Categories=Development;Web
MimeType=text/html;
Keywords=MariaDB;PHP;Perl;" | sudo tee "$desktop_file"
fi

# Create symbolic link to start XAMPP
if [ ! -f "/usr/local/bin/$appname" ] ; then
    echo "sudo /opt/lampp/manager-linux-x64.run" | sudo tee "/usr/local/bin/$appname"
    sudo chmod +x "/usr/local/bin/$appname"
fi

echo "XAMPP is installed and ready to use."
echo "To start XAMPP, type 'xampp' in the terminal." 

rm $zipfile