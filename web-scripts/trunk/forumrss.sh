#!/bin/sh

# downloads forum feed, transforms it to html and uploads

RSSTMP=`mktemp`
BASEDIR=`dirname $0`

source $BASEDIR/config.sh

if wget -q -O $RSSTMP "http://forums.winamp.com/backend.php?forumid=65&limit=5"; then
	xsltproc $BASEDIR/forumrss.xsl $RSSTMP | tail -n 1 > $RSSTMP.html
	scp -q -i $SFKEY $RSSTMP.html $SFUSER@$SFSERV:$SFDIR/forum.rss.html
fi

rm -f $RSSTMP > /dev/null
rm -f $RSSTMP.html > /dev/null

F=`mktemp`
wget -q -O $F --post-data=OK "http://nsis.sourceforge.net/Main_Page?action=purge"
rm -f $F
