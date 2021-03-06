#!/bin/bash
# File: shutdownBackupServer.sh
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
# Shuts the Backup Server down
#
# Param1 server hostname to shutdown
# Retry count of ping request
RETRYCOUNT=1;
ping -c $RETRYCOUNT $1 > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "$1 not running."
else
  # Remove password and admin from script; replace with certifcates
  echo "Sending shutdown command. This will take about 3 Minutes"
  sshpass -p '1st@All' ssh -o StrictHostKeyChecking=no admin@192.168.178.33 /sbin/poweroff
  sleep 150
  ping -c $RETRYCOUNT $1 > /dev/null 2>&1
  if [ $? -ne 0 ]
  then
    echo "$1 still running. Try to shutdown manually."
    exit 1
  else
    echo "$1 successfully shutdown."
  fi
fi
