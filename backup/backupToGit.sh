#!/bin/bash
###########

########################
# Variables
########################

# Repositories to backup
repos="/home/cola/Git/TeX /home/cola/Git/Java /home/cola/Git/LUA /home/cola/Git/Android /home/cola/Git/Linux /home/cola/Git/Python /home/cola/Git/ /home/cola/Git/Home/Web/Server";
# Remember current directory
currentDirectory=$(pwd);
# create current date variable
today=$(date '+%Y-%m-%d');
# create update message
message="Auto update from $today";
######################
# Logic
######################
echo "Backing up repositories:"
for repo in $repos
do
    echo -n "   Pushing $repo ...";
    cd $repo;
    git add -A;
    git commit -m "$message";
    git push;
    echo " done"
done
cd $currentDirectory

