#!/bin/bash

TEMP=$(grep '/usr/s\?bin' /etc/systemd/system/display-manager.service)
echo "Display Manager: $TEMP"

echo "Desktop: $DESKTOP_SESSION"

