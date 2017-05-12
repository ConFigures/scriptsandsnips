#!/bin/bash
# This script only starts the creation; tinkering needed afterwards
# example: ./createUUIDbatch.sh /allmysvn/biorepos

echo Directories and UUIDs in $1
cd $1
for i in $( ls ); do
    echo $i
    svnlook uuid $i 
done

# Then join each pair of lines in output so each line has format 
# repository UUID
# Then enter vi command :%s/^/svnadmin setuuid / to add that to start of each line

