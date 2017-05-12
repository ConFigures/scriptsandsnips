#!/bin/sh

# This script checks out a repository (the same one each time, for comparison).

# Get repository host

#set -x
ARGS=2
getval=""
shopt -s -o nounset

if [ $# -ne "$ARGS" ]
then
 echo "Usage: `basename $0` <repository host> <username>"
 exit 1
fi

repository_host=$1
LDAP=$2

# Perform and log checkout

mkdir /allmysvn/tmp
cd /allmysvn/tmp
echo "Testing checkout" >> /tmp/perf.out
date >> /tmp/perf.out
svn checkout --username $LDAP https://$repository_host/svn/testload/trunk
date >> /tmp/perf.out
echo "Checkout completed" >> /tmp/perf.out
