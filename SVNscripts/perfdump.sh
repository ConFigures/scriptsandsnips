#!/bin/sh

# This script dumps a repository into /tmp/testdump.out.

echo "---------------------------------------" >> /tmp/perf.out
cd /allmysvn/biorepos
echo "Testing dump" >> /tmp/perf.out
date >> /tmp/perf.out
echo "Size of repo to be dumped" >> /tmp/perf.out
du -sh automation >> /tmp/perf.out
svnadmin dump automation > /allmysvn/dumps/testdump.dump
date >> /tmp/perf.out
echo "Dump completed" >> /tmp/perf.out
