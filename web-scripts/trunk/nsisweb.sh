#!/bin/sh

BASEDIR=`dirname $0`

source $BASEDIR/config.sh

# updates htdocs files from svn

umask 0002
cd $SFDIR/bin/nsisweb
svn -q up
cp -rf . $SFDIR/htdocs/
rm -rf `find $SFDIR/htdocs -name .svn`
