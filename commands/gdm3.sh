sudo apt-get install gdm3
sudo systemctl disable lightdm.service
sudo systemctl enable gdm3.service


#ls -l /etc/systemd/system/display-manager.service
#sudo ln -s /lib/systemd/system/gdm3.service /etc/systemd/system/display-manager.service
#sudo systemctl start gdm3.service
#sudo systemctl enable gdm3.service
