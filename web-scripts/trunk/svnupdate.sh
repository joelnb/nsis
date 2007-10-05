#!/bin/sh

# updates main svn module

umask 0002
pushd /home/groups/n/ns/nsis/bin/svn
while [ -e /tmp/nsis.svn.lock ]; do sleep 5; done
touch /tmp/nsis.svn.lock
chmod 660 /tmp/nsis.svn.lock
pushd NSIS
svn -q up
popd
rm -f /tmp/nsis.svn.lock
popd
