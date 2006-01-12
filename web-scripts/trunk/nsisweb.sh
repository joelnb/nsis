#!/bin/sh

# updates htdocs files from cvs

umask 0002
cd /home/groups/n/ns/nsis/bin/nsisweb
cvs -q update -PRd
cp -rf . ../../htdocs/
rm -rf `find ../../htdocs -name CVS`
