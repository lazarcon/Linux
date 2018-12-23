#!/bin/bash
# File: skript.sh
# Author: Constantin Lazari
# Date: YYYY-MM-DD
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

# Shell script to find out all the files under a directory and 
# its subdirectories. This also takes into consideration those files
# or directories which have spaces or newlines in their names 

DIR="."

function list_files()
{
	if !(test -d "$1") # Stop if there is no argument
	then 
		echo $1; return;
	fi

	gvfs-set-attribute "$1" -t unset metadata::custom-icon
	cd "$1"
	echo Changed Icon of Directory "$1"

	#echo; echo `pwd`:; #Display Directory name

	for i in * 
	do
		if test -d "$i" #if dictionary
 		then 
			list_files "$i" #recursively list files
			cd ..
 		#else
 			#echo "$i"; #Display File name
		fi
	done
}

if [ $# -eq 0 ]
then list_files .
	exit 0
fi

for i in $*
do
	DIR="$1"
	list_files "$DIR"
	shift 1 #To read next directory/file name
done
