#!/bin/sh

# updates htdocs files from svn

umask 0002
cd /home/groups/n/ns/nsis/bin/nsisweb
svn -q up
cp -rf . ../../htdocs/
rm -rf `find ../../htdocs -name .svn`
