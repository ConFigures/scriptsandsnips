#!/bin/sh

# This script creates a new repository and loads it with a dump file for performance testing.

cd /allmysvn/biorepos
echo "Testing load" >> /tmp/perf.out
date >> /tmp/perf.out
svnadmin create testload
svnadmin load testload < /allmysvn/dumps/testdump.dump --bypass-prop-validation
chown -R apache:nobody testload
date >> /tmp/perf.out
echo "Load completed" >> /tmp/perf.out
