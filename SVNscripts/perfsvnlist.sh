#!/bin/sh

# runs a simple performance test against a few sample subversion repos

# Get repository host

#set -x
ARGS=3
getval=""
shopt -s -o nounset

if [ $# -ne "$ARGS" ]
then
 echo "Usage: `basename $0` <repository host, e.g., host.example.org> <LDAP> <password>"
 echo "Remember to use history -d <line number> afterwards for security"
 exit 1
fi

repository_host=$1
LDAP=$2
P=$3

#Peform and log list operation

START_TIME=`date +%s`
echo Start time = $START_TIME  >> /tmp/perf.out
# list of subversion repos
for repo in \
     automation \
     commonlibrary
do
echo "Testing svn list against $repository_host $repo"  >> /tmp/perf.out
svn list -R https://$repository_host/svn/$repo/trunk --non-interactive --trust-server-cert --username $LDAP --password $P
done
END_TIME=`date +%s`
TOTAL_TIME=$[$END_TIME - $START_TIME]
echo End Time = $END_TIME  >> /tmp/perf.out
echo "Total time in seconds" $TOTAL_TIME  >> /tmp/perf.out
