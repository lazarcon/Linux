#!/bin/bash

FILENAME="packages"

tar -zxf "$FILENAME.tar.gz"

rm -f "$FILENAME.tar.gz"

# read the lines of the package file
while IFS= read -r line; do
    sudo apt install "$line"
done < "$FILENAME.txt"

