#!/bin/sh

# runs a simple performance test against a few sample subversion repos

HOSTROOT='https://host.example.org/svn'

START_TIME=`date +%s`
# random list of subversion repos
for repo in \
     automation \
     commonlibrary 
do
echo Testing svn info
svn info $HOSTROOT/$repo/trunk
echo Testing svn list
svn list -R $HOSTROOT/$repo/trunk
done
END_TIME=`date +%s`
TOTAL_TIME=$[$END_TIME - $START_TIME]
echo Start time = $START_TIME
echo End Time = $END_TIME
echo Total time in seconds = $TOTAL_TIME

