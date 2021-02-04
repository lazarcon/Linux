#!/bin/bash
# aescrypt_keygen -p "theSecretPassword" password.key
FILE=$1
KEYFILE=/home/cola/.keys/GoogleDrive.key
aescrypt -e -k "$KEYFILE" "$FILE"
mv "$FILE.aes" "/media/cola/GoogleDrive/Encrypted/"

## Move in Linux actually moves and does not keep a copy around as in DOS
#rm -f "$FILE.aes"
