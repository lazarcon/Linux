#! /bin/bash
sed -e 's/\(^.*\/target\/.*$\)/rm -f \1/g' colaRemoves.sh > colaRemovesTarget.sh
sed -ie 's/\(^.*\/CVS\/.*$\)/rm -f \1/g' colaRemovesTarget.sh
