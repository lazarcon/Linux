# Ubuntu Cloning

1. Create a list of all installed packages:
`dpkg --get-selections | grep -v deinstall > ~/Workspaces/Linux/backup/packages.txt`

2. Install all packages from your list:
`sudo dpkg --set-selections < ~/Desktop/packages && sudo apt-get -u dselect-upgrade`

