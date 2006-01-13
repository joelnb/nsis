#!/bin/sh

# updates change log

START_DATE=`find cl.timestamp -printf %Tc`

PROJDIR=/home/groups/n/ns/nsis
HTDOCSDIR=$PROJDIR/htdocs
BINDIR=$PROJDIR/bin
CVSDIR=$BINDIR/cvs/NSIS
CVS2CL=$BINDIR/cvs2cl.pl
USERMAP=$BINDIR/user.map
CLHTMLNEW=$BINDIR/cl.htm
CLHTML=$HTDOCSDIR/nightly/changelog.htm

umask 0002

cd $CVSDIR
$BINDIR/cvsupdate.sh

$CVS2CL -f $CLHTMLNEW -l "-d'>$START_DATE'" -b -g "-q"
if ! diff $CLHTMLNEW $CLHTML; then
	cp $CLHTMLNEW $CLHTML
fi

rm -f $CLHTMLNEW
