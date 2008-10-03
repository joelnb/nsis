#!/bin/sh

# updates change log tag revision

PROJDIR=/home/groups/n/ns/nsis
BINDIR=$PROJDIR/bin
TAGFILE=$BINDIR/cl.tagrev

SVNROOT=https://nsis.svn.sourceforge.net/svnroot/nsis/NSIS/

umask 0002

svn info $SVNROOT | grep Revision | cut -d ':' -f 2 > $TAGFILE
