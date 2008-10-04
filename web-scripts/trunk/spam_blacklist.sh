#!/bin/bash

# updates the spam blacklist and uploads it

BASEDIR=`dirname $0`
LISTTMP=`mktemp`

source $BASEDIR/config.sh

if $BASEDIR/spam_blacklist.py > $LISTTMP; then
	scp -q -i $SFKEY $LISTTMP $SFUSER@$SFSERV:$SFDIR/htdocs/mediawiki/spam_blacklist
else
	cat $LISTTMP # error text
fi

rm -f $LISTTMP
