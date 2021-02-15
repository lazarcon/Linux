#!/bin/bash
# File: removeDuplicates.sh
# Author: Constantin Lazari
# Date: 2018-12-21
#
# Software Notice and License
# This work (and included software, documentation such as READMEs, or other related items)
# is being provided by the copyright holders under the following license.
#
# By obtaining, using and/or copying this work, you (the licensee) agree that you have read, understood,
# and will comply with the following terms and conditions.
# Permission to copy, modify, and distribute this software and its documentation, with or without modification,
# for any purpose and without fee or royalty is hereby granted, provided that you include the following on
# ALL copies of the software and documentation or portions thereof, including modifications:
#   1. The full text of this NOTICE in a location viewable to users of the redistributed or derivative work.
#   2. Any pre-existing intellectual property disclaimers, notices, or terms and conditions.
#      If none exist, this Software Short Notice should be included (hypertext is preferred, text is permitted)
#      within the body of any redistributed or derivative code.
#   3. Notice of any changes or modifications to the files, including the date changes were made.
#      (We recommend you provide URIs to the location from which the code is derived.)
#
# THIS SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS," AND COPYRIGHT HOLDERS MAKE NO REPRESENTATIONS OR WARRANTIES,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR
# PURPOSE OR THAT THE USE OF THE SOFTWARE OR DOCUMENTATION WILL NOT INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS,
# TRADEMARKS OR OTHER RIGHTS.
# COPYRIGHT HOLDERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF
# ANY USE OF THE SOFTWARE OR DOCUMENTATION.
# The name and trademarks of copyright holders may NOT be used in advertising or publicity pertaining to the software
# without specific, written prior permission.
# Title to copyright in this software and any associated documentation will at all times remain with copyright holders.
# This work is licensed under the W3C Software Notice and License.
# Quelle fdupes: https://github.com/adrianlopezroche/fdupes
#############################################################################################################
FOLDER1=$1
FOLDER2=$2
OUTPUT="rm"

echo "Removing duplicates of $FOLDER1 in $FOLDER2, keeping contents of $FOLDER2 and cleaning $FOLDER1"
echo "Continue? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ]
then
  # Find Duplicates in two folders:
  echo "Searching duplicates (this might take a while, be patient)"
  fdupes -r "$FOLDER1" "$FOLDER2" > "$OUTPUT.1.txt"
  echo "Removing all lines refering to $FOLDER1"
  grep -v "^$FOLDER2" "$OUTPUT.1.txt" > "$OUTPUT.2.txt"
  echo "Removing all empty lines"
  sed -r "/^\s*$/d" "$OUTPUT.2.txt" > "$OUTPUT.3.txt"
  echo "Creating skript for removal"
  sed "s/\(.*\)/rm -f \"\1\"/g" "$OUTPUT.3.txt" > "$OUTPUT.sh"
  echo "Removing duplicate files"
  chmod +x "$OUTPUT.sh"
  "./$OUTPUT.sh"
  echo "Removing all remaing empty folders"
  find '$FOLDER1' -empty -type d -delete
  echo "Moving all remaining files from $FOLDER1 to $FOLDER2"
  mv -n "$FOLDER1" "$FOLDER2"
  echo "  Removing created files"
  rm -f "./rm.1.txt"
  rm -f "./rm.2.txt"
  rm -f "./rm.3.txt"
  rm -f "./rm.sh"
  echo "Done!"
fi
