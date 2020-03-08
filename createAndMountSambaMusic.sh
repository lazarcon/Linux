#!/bin/bash

echo "Installing sshfs and fuse:"
sudo apt install -y sshfs fuse

echo "Creating fuse group"
sudo groupadd fuse


echo "Adding user to group"
sudo adduser cola fuse

echo "Creating Mount Target"
mkdir ~/SambaMusic

echo "Mounting SambaMusic"
sshfs pi@raspberrypi:/media/usbmusic/music ~/SambaMusic

echo "Changing into Directory"
cd ~/SambaMusic

