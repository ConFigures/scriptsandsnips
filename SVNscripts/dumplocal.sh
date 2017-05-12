#!/bin/sh

# This is a script meant to automate a simple svn dump process.
# It assumes the repository is under /allmysvn/biorepos and /allmysvn/dumps/ exists.
# Any migrations involving name changes or restructuring should be done manually.

# Make repository read-only to prep for dump.

#set -x
ARGS=1
getval=""
shopt -s -o nounset

if [ $# -ne "$ARGS" ]
then
 echo "Usage: `basename $0` repo-name"
 exit 1
fi

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


repository_name=$1
  
cd /allmysvn/biorepos
chmod -R 555 $repository_name

# Report repository details
ls -l | grep $repository_name
du -sh $repository_name

read -p "Continue? [y|n] " getval

if [[ $getval != 'y' && $getval != 'Y' ]]; then
        echo Quitting.
        exit 0
fi


# Run svn dump command
svnadmin dump ${repository_name} > /allmysvn/dumps/${repository_name}.dump
chmod 644 /allmysvn/dumps/${repository_name}.dump
