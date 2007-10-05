#!/bin/sh

# updates change log

PROJDIR=/home/groups/n/ns/nsis
HTDOCSDIR=$PROJDIR/htdocs
BINDIR=$PROJDIR/bin
USERMAP=$BINDIR/user.map
CLHTMLNEW=$BINDIR/cl.htm
CLHTML=$HTDOCSDIR/nightly/changelog.htm

XSL=cl.xsl
SVNLOG="svn log --xml --verbose"
SVNROOT=https://nsis.svn.sourceforge.net/svnroot/nsis/NSIS/

TAGREV=$((`cat $BINDIR/cl.tagrev` + 1))

umask 0002

$SVNLOG -r HEAD:$TAGREV $SVNROOT | xsltproc $XSL - | grep -v '^<?xml version="1.0"?>$' > $CLHTMLNEW

if ! diff -q $CLHTMLNEW $CLHTML; then
	cp $CLHTMLNEW $CLHTML
fi

rm -f $CLHTMLNEW
