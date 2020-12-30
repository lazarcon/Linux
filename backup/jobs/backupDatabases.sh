#!/bin/bash
# File: backupDatabases.sh
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
# Creates a backup of databases:
#
# Param1: path to system-backup
#############################################################################################################
DATABASE_FOLDER=$1/databases/mysql;
CREDENTIALS=/home/cola/.keys/mySQL.credentials.cnf

echo " Backing up mysql databases ..."
for DATABASE in $(mysql --defaults-extra-file=$CREDENTIALS -e 'show databases' -s --skip-column-names); do
#DATABASES="mysql recipes TieferGedacht AmHollbusch1 zitate greece";
#for DATABASE in $DATABASES
#do
  STORE_PATH="$DATABASE_FOLDER/$DATABASE.sql.gz";
  BACKUP_PATH="$STORE_PATH.previous";
  #rm -f $STORE_PATH
  rm -f $BACKUP_PATH > /dev/null;
  mv $STORE_PATH $BACKUP_PATH > /dev/null;
  mysqldump --defaults-extra-file=$CREDENTIALS $DATABASE | gzip > $STORE_PATH;
  #mysqldump --defaults-extra-file=credentials.cnf $DATABASE > $STORE_PATH
  echo "    Backup of \"$DATABASE\" in \"$STORE_PATH\" created"
done

#cd /home/cola > /dev/null
#DATABASE_FOLDER=$1/databases/postgres;
#DATABASES="mayan";
#echo "  Backing up postgres databases ..."
#for DATABASE in $DATABASES
#do
#  STORE_PATH="$DATABASE_FOLDER/$DATABASE.psql";
#  BACKUP_PATH="$STORE_PATH.previous"
#  #rm -f $STORE_PATH
#  rm -f $BACKUP_PATH
#  mv $STORE_PATH $BACKUP_PATH
#  sudo -u postgres pg_dump --clean --create $DATABASE > "$DATABASE.psql"
#  mv "$DATABASE.psql" $STORE_PATH
#  echo "    Backup of \"$DATABASE\" created"
#done
#echo "...done"
