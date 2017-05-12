#!/bin/sh

# This script creates a new repository and loads it from a dump file.
# The dump file can be generated manually or by using a script.
# If you are doing anything more complicated, do a manual creation and load. 

#Check to make sure repository name is entered.
#set -x
ARGS=1
getval=""
shopt -s -o nounset

if [ $# -ne "$ARGS" ]
then
 echo "Usage: `basename $0` repo-name"
 exit 1
fi

repository_name=$1

# Check that repository does not currently exist
  cd /allmysvn/biorepos
  ls -l | grep $repository_name

read -p "Continue? " getval

if [[ $getval != 'y' && $getval != 'Y' ]]; then
        echo Quitting.
        exit 0
fi

# Create the new repository
  svnadmin create $repository_name

# Load dump file into new repository
  svnadmin load --bypass-prop-validation ${repository_name} < /allmysvn/dumps/${repository_name}.dump

# Change ownership recursively on new repository
  chown -R apache:nobody ${repository_name}

