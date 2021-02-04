#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

rm -f sources.tar.gz >> /dev/null
cd /etc/apt/
tar -czf "$SCRIPTPATH/sources.tar.gz" ./sources.list.d/
cd $SCRIPTPATH
