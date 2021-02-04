#MyCloudSetup

Ich benutze vier Cloud-Dienste:

1. GoogleDrive (15 GB)
2. Microsoft OneDrive (5 GB)
3. Dropbox (2 GB)
4. Github (? GB)

## Google Drive ([Linuxhint](https://linuxhint.com/google_drive_installation_ubuntu/))
Google Drive lässt sich unter Linux Problems über OnlineAccounts einbinden.
Um GoogleDrive als normalen Ordner zu behandeln (inkl. Symlinks) ist es allerdings nötig zusätzlich google-drive-ocamlfuse zu installieren

GoogleDrive ist bei mir zuständig für meine Privaten und allenfalls öffentlichen Dokumente. Ausserdem Avatare und andere gelegentlich und allgemein benutzte Dateien.

```
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo sudo apt update && sudo apt install google-drive-ocamlfuse
```

## Microsoft OneDrive
Lässt sich ebenfalls installieren. Die notwendigen Dateien und die Anleitung findet man bei [Github](https://github.com/abraunegg/onedrive)

Den Dienst am besten am Anfang und am Ende einer Sitzung laufen lassen.
```
onedrive --synchronize
```

Das Programm vergisst gerne seine Autorisierung oder der Token von Microsoft läuft ab. Jedenfalls ist dann ein Logout erforderlich, dass gleichzeitig ein erneuter Login ist. Danach sollte es dann laufen.

```
onedrive --logout
```

Wofür Microsoft genau zuständig sein soll, ist mir noch nicht klar.

## Dropbox ([Ubuntu Wiki](https://wiki.ubuntuusers.de/Dropbox/))
Lässt sich ebenfalls leicht installieren:

```
sudo apt-get install nautilus-dropbox
```

Falls nötig lässt sich der Dienst via
```
dropbox start -i 
```

Dropbox ist bei mir zuständig für meine PDF-Bücherei. Sonst nichts.

