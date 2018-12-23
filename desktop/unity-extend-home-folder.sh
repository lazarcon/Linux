echo "[Desktop Entry]

Name=Home Folder
Comment=Open your personal folder
TryExec=nautilus
Exec=nautilus --no-desktop
Icon=user-home
Terminal=false
StartupNotify=true
Type=Application
Categories=GNOME;GTK;Core;
OnlyShowIn=GNOME;Unity;
X-GNOME-Bugzilla-Bugzilla=GNOME
X-GNOME-Bugzilla-Product=nautilus
X-GNOME-Bugzilla-Component=general
X-Ubuntu-Gettext-Domain=nautilus

X-Ayatana-Desktop-Shortcuts=Documents;Workspaces;Music;Pictures;Videos;Downloads

[Documents Shortcut Group]
Name=Documents
Exec=nautilus Documents
TargetEnvironment=Unity

[Workspaces Shortcut Group]
Name=Workspaces
Exec=nautilus Workspaces
TargetEnvironment=Unity

[Music Shortcut Group]
Name=Music
Exec=nautilus Music
TargetEnvironment=Unity

[Pictures Shortcut Group]
Name=Pictures
Exec=nautilus Pictures
TargetEnvironment=Unity

[Videos Shortcut Group]
Name=Videos
Exec=nautilus Videos
TargetEnvironment=Unity

[Downloads Shortcut Group]
Name=Downloads
Exec=nautilus Downloads
TargetEnvironment=Unity" | sudo tee /usr/share/applications/nautilus-home.desktop

