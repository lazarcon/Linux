#!/bin/bash
# Mounts the encrypted private drive
# Basic Source: https://evilshit.wordpress.com/2012/10/29/how-to-mount-luks-encrypted-partitions-manually/
# Must be executed as superuser (sudo ...)
##########################################################################################################
#
# 1. Find mapping of device
MAPPED=$(blkid | grep crypto | grep -o '\/dev\/[a-zA-Z0-9\/]*')
# FYI: Find device UUID
#UUID=$(blkid | grep crypto | grep -o '[a-f0-9]*-[a-f0-9]*-[a-f0-9]*-[a-f0-9]*-[$
# 2. Open partition and give it a name:
cryptsetup luksOpen $MAPPED/ Private
# Passphrase required ...
