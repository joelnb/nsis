#!/bin/sh

# updates main cvs module

umask 0002
pushd /home/groups/n/ns/nsis/bin/cvs
while [ -e /tmp/nsis.cvs.lock ]; do sleep 5; done
touch /tmp/nsis.cvs.lock
chmod 660 /tmp/nsis.cvs.lock
pushd NSIS
cvs -Q update -PRd
popd
rm -f /tmp/nsis.cvs.lock
popd
