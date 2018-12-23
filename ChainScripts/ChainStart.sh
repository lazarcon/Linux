#!/bin/bash
echo "Test:"
source ./subscript1.sh
echo That was script 0
source ./subscript2.sh
echo That was script 1 -- this line shout not be visible
