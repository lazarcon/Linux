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
echo "Backup NTFS to $1 "
cd /media/NTFS > /dev/null
# Backup User Dirs
tar -cpzf $1/Users.tar.gz Users
echo "  Backup of \"/Users\" created"
tar -cpzf $1/Win/Users.tar.gz Win/Users
echo "  Backup of \"/Win/Users\" created"
tar -cpzf $1/Mayan.tar.gz Mayan
echo "  Backup of \"/Mayan\" created"
echo "  Now Syncing Media Files:"

rsync -za /media/NTFS/Media/Texts/ /media/cola/Qnap/Backups/Zenon/NTFS/Media/Texts/ > /dev/null
echo "    - Texts synced "
rsync -za /media/NTFS/Media/Texts/ /media/cola/Qnap/Backups/Zenon/NTFS/Media/Texts/ > /dev/null
echo "    - Texts synced "

# WoW Backup
#tar -cpzf $1/Win/WoW/AddOns.tar.gz Win/Program\ Files/WoW/_retail_/Interface/AddOns
#echo "  Backup of \"/Win/Program Files/WoW/_retail_/Interface/AddOns\" created"
#tar -cpzf $1/Win/WoW/WTF.tar.gz Win/Program\ Files/WoW/_retail_/WTF
#echo "  Backup of \"/Win/Program Files/WoW/_retail_/WTF\" created"
#tar -cpzf $1/Win/WoW/MyThoughts.tar.gz Win/Program\ Files/WoW/MyThoughts
#echo "  Backup of \"/Win/Program Files/WoW/Interface/MyThoughts\" created"
#tar -cpzf $1/Win/WoW/TradeSkillMaster.tar.gz Win/Program\ Files/WoW/TradeSkillMaster
#echo "  Backup of \"/Win/Program Files/WoW/Interface/TradeSkillMaster\" created"

# Installers
tar -cpzf $1/Win/Installers.tar.gz Win/Program\ Files/__Installers
echo "  Backup of \"/Win/Program Files/__Installers\" created"

cd - > /dev/null
echo "... done"
