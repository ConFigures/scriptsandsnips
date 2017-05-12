#!/bin/bash
# example: ./verify.sh /allmysvn/biorepos > /tmp/verify.out

echo Directories and UUIDs in $1
cd $1
for i in $( ls ); do
    echo $i
    svnadmin verify -q $i 
done

