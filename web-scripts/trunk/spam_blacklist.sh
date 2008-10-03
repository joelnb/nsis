#!/bin/bash

# updates the spam blacklist and uploads it

source config.sh

BASEDIR=`dirname $0`
LISTTMP=`mktemp`

if $BASEDIR/spam_blacklist.py > $LISTTMP; then
	scp -q -i $SFKEY $LISTTMP $SFUSER@$SFSERV:$SFDIR/htdocs/mediawiki/spam_blacklist
else
	cat $LISTTMP # error text
fi

rm -f $LISTTMP
