#!/bin/sh

# updates change log and uploads

BASEDIR=`dirname $0`

source $BASEDIR/config.sh

# local

XSL=$BASEDIR/cl.xsl

# remote

HTDOCSDIR=$SFDIR/htdocs
CLHTML=$HTDOCSDIR/nightly/changelog.htm

# others

SVNLOG="svn log --xml --verbose"

# latest tag

if TAG=`svn list $SVNROOT/tags`; then
	TAG=`echo $TAG | grep '^v' | cut -d / -f 1 | sort -n | tail -n 1`
	if TAGINFO=`svn info --xml $SVNROOT/tags/$TAG`; then
		TAGREV=$((`echo $TAGINFO | xmlstarlet sel -t -m /info/entry/commit -v "@revision"` + 1))
	else
		echo can't get tag info
		exit 1
	fi
else
	echo can't get tag list
	exit 1
fi

# log it

LOGTMP=`mktemp`

if $SVNLOG -r HEAD:$TAGREV $SVNROOT | xsltproc $XSL - | grep -v '^<?xml version="1.0"?>$' > $LOGTMP; then
	scp -q -i $SFKEY $LOGTMP $SFUSER@$SFSERV:$CLHTML
fi

rm -f $LOGTMP
