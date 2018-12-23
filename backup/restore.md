# Restore
## System

### Installed Software
Reinstall your software with:

`sudo apt install -y $(< installedPackages.txt)`

Remove unwanted packages with:

`sudo apt autoremove`

### Configuration
Just replace your /etc with your /etc-Backup

### Databases
To restore a single database:
`mysql database_name < database_name.sql`
