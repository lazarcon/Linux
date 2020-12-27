#!/bin/bash
# File: backup.sh
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
# Backups the current system;
# There are severall jobs to be done so they are separated into single job files
# and executed from this file
#
## Params:
#MACHINE=Zenon;
BACKUP_SERVER_NAME=Bacchus;
BACKUP_SERVER_MAC=00:08:9B:CD:4E:3E;
MOUNT_POINT=/media/cola/Qnap;
ROOT_FOLDER=/home/cola/Git/Linux/backup;


# Asign Machine Name according to hostname
# show hostname: $hostname
# change hostname: $sudo hostnamectl set-hostname NEWNAME
if [ "$HOSTNAME" == "Helena" ];
then
        MACHINE="Lenovo"
elif [ "$HOSTNAME" ==  "Zeus" ]
then
        MACHINE="Zenon"
else
        MACHINE="Unknown"
fi
BACKUP_FOLDER=$MOUNT_POINT/Backups/$MACHINE/Linux;
BACKUP_NTFS=$MOUNT_POINT/Backups/$MACHINE/NTFS;
#BACKUP_FOLDER=smb://192.168.178.33/cola/Backups/Zenon/Linux;
# Start the Backup-Server:
#source ./jobs/startBackupServer.sh $BACKUP_SERVER_NAME $BACKUP_SERVER_MAC

# Mount the Backup-Server:
source $ROOT_FOLDER/jobs/mountBackupServer.sh $BACKUP_SERVER_NAME $MOUNT_POINT

# Backup system files
source $ROOT_FOLDER/jobs/backupDatabases.sh $BACKUP_FOLDER
source $ROOT_FOLDER/jobs/backupSystem.sh $BACKUP_FOLDER

# Backup NTFS-Data
source $ROOT_FOLDER/jobs/backupNTFS.sh $BACKUP_NTFS

# Sync user files
source $ROOT_FOLDER/jobs/backupCola.sh $BACKUP_FOLDER

# Unmount the Backup-Server:
source $ROOT_FOLDER/jobs/umountBackupServer.sh MOUNT_POINT

# Shut down the Backup-Server again:
#source ./jobs/shutdownBackupServer.sh BACKUP_SERVER_NAME
