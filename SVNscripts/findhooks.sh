#!/bin/bash
# example: ./findhooks.sh /allmysvn/biorepos > /tmp/hooks.out

echo Non-template hook scripts in $1
cd $1
for i in $( ls ); do
    echo $i
    cd $i/hooks
    find . -type f -not -name "*.tmpl"
    cd ../..
done

