#!/bin/bash
echo "Restoring installed packages:"
echo "  1. Adding Repo Keys"
apt-key add $SYSTEM_FOLDER/Repo.keys > /dev/null
echo "  2. Adding Sources"
cp -R $SYSTEM_FOLDER/sources.list* /etc/apt/ 
echo "  3. Updating Repositories"
apt-get update > /dev/null
echo "  4. Installing latest Helper Tool"
apt-get install dselect > /dev/null
dselect update > /dev/null
echo "  5. Reading stored package list"
dpkg --set-selections < $SYSTEM_FOLDER/packages.list > /dev/null
echo "  6. Reinstalling packages (this might take a while)"
apt-get dselect-upgrade -y > /dev/null
echo "... done (restoring installed packages)"
