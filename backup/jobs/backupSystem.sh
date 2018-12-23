#!/bin/bash
# File: backupSystem.sh
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
# Creates a backup of the system:
#
# Param1: path to system-backup
#############################################################################################################
# Create a list of installed packages
SYSTEM_FOLDER=$1/system;
echo "Saving list of installed packages to "
echo "  $SYSTEM_FOLDER"
dpkg --get-selections | grep -v deinstall > $SYSTEM_FOLDER/installedPackages.txt
echo "Backing up system files and home directories excluding \"cola\"..."
# Switch to root directory to backup system files
cd / > /dev/null
tar -cpzf $SYSTEM_FOLDER/etc.tar.gz etc
echo "  Backup of \"/etc\" created"

tar -cpzf $SYSTEM_FOLDER/srv.tar.gz srv
echo "  Backup of \"/srv\" created"

tar -cpzf $SYSTEM_FOLDER/root.tar.gz root
echo "  Backup of \"/root\" created"

tar -cpzf $SYSTEM_FOLDER/usr.local.tar.gz usr/local
echo "  Backup of \"/usr/local\" created"

tar -cpzf $SYSTEM_FOLDER/usr.tar.gz --exclude=usr/local usr
echo "  Backup of \"/usr\" created"

tar --exclude=var/run --exclude=var/cache --exclude=var/tmp -cpzf $SYSTEM_FOLDER/var.tar.gz var
echo "  Backup of \"/var\" created"
# Switch back to original directory

tar --exclude=home/cola -cpzf $1/home.tar.gz home
echo "  Backup of \"/home\" (except home/cola) created"
cd - > /dev/null
echo "... done"
