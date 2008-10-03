#!/bin/sh

# updates change log and uploads

source config.sh

BASEDIR=`dirname $0`

# local

XSL=$BASEDIR/cl.xsl
LOGTMP=`mktemp`

# remote

HTDOCSDIR=$SFDIR/htdocs
CLHTML=$HTDOCSDIR/nightly/changelog.htm
SVNROOT=https://nsis.svn.sourceforge.net/svnroot/nsis/NSIS/

# others

SVNLOG="svn log --xml --verbose"

# latest tag

TAG=`svn list $SVNROOT/tags | grep '^v' | cut -d / -f 1 | sort -n | tail -n 1`
TAGINFO=`svn info --xml $SVNROOT/tags/$TAG`
TAGREV=$((`echo $TAGINFO | xmlstarlet sel -t -m /info/entry/commit -v "@revision"` + 1))

if $SVNLOG -r HEAD:$TAGREV $SVNROOT | xsltproc $XSL - | grep -v '^<?xml version="1.0"?>$' > $LOGTMP; then
	scp -q -i $SFKEY $LOGTMP $SFUSER@$SFSERV:$CLHTML
fi

rm -f $LOGTMP
