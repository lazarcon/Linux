#!/bin/bash

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://debian.neo4j.com stable 4.1"
sudo apt install neo4j

echo "Reboot is recommendet. After reboot enable neo4j service: sudo systemctl enable neo4.service"

