#!/bin/sh
# code  is to identify the most recently modified repositories using svnlook

cd /allmysvn/biorepos
ls -l /allmysvn/biorepos | grep "apache nobody" | awk '{print $9}' > listofrepo

for repo in `cat listofrepo`
do
  if [ -d "$repo" ]
  then

         echo " $repo `svnlook date $repo`" | grep "2017-05"  
fi
done

