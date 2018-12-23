#!/bin/bash
# File: backupHome.sh
# Author: Constantin Lazari
# Date: 2017-06-07
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
#############################################################################################################
#
# Creates a backup of the home folders:
#
# Param1: path to system-backup
#############################################################################################################
# Create a list of installed packages
HOME_FOLDER=$1/home/cola;
FOLDERS="Documents Projects Public Templates Workspaces";

echo "Backup \"/home/cola\" to $HOME_FOLDER "
cp /home/cola/Git/ReadMe.md "$HOME_FOLDER/Git/ReadMe.md"
echo "  Backup of \"/home/cola/Git/ReadMe.md\" created"
cd /home/cola > /dev/null
tar -cpzf "$HOME_FOLDER/hidden.tar.gz"  \
  \.bashrc \
  \.bash_aliases \
  \.cert \
  \.keys \
  \.ssh \
  ssl
echo "  Backup of important hidden files from \"/home/cola/\" created"
for FOLDER in $FOLDERS
do
  SOURCE="/home/cola/$FOLDER"
  TARGET="$HOME_FOLDER/$FOLDER";
  rsync -a $SOURCE $TARGET
  echo "  Backup of \"$SOURCE\" created"
done

echo "...done"
