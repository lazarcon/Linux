#!/bin/bash

rsync -u -a --stats --progress "ssh -i /home/cola/.ssh/id_rsa" /media/NTFS/Media/Audio/163Music/ pi@raspberrypi:/media/usbmusic/music/ 


