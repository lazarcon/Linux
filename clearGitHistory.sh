#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    echo "I need two arguments:"
    echo "1. Full path to top level or repository"
    echo "   e.g. /home/cola/Git/Linux"
    echo "2. name of repository"
    echo "   e.g. linux"
    echo "So full command would be: ./clearGitHistory /home/cola/Git/LUA LUA"
    exit 1
fi

echo "Changing to $1, cloning $2:"

cd $1

## Remove the history from 
#rm -rf .git

## recreate the repos from the current content only
#git init
#git add .
#git commit -m "Initial commit"

## push to the github remote repos ensuring you overwrite history
#git remote add origin "git@github.com:lazarcon/$2.git"
#git push -u --force origin master

