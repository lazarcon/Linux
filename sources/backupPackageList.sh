#!/bin/bash

FILENAME="packages"

apt list --installed >> "$FILENAME.txt"
tar -czf "$FILENAME.tar.gz" "$FILENAME.txt"
rm -f "FILENAME.txt"

