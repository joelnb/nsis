#!/bin/sh

# downloads news feed, transforms it to html and uploads

RSSTMP=`mktemp`
BASEDIR=`dirname $0`

source $BASEDIR/config.sh

if wget -q -O $RSSTMP "http://sourceforge.net/export/rss2_projnews.php?group_id=22049&rss_fulltext=1&rss_limit=3"; then
	if xsltproc $BASEDIR/newsrss.xsl $RSSTMP | tail -n 1 > $RSSTMP.html; then
		scp -q -i $SFKEY $RSSTMP.html $SFUSER@$SFSERV:$SFDIR/news.rss.html
	fi
fi

rm -f $RSSTMP
rm -f $RSSTMP.html
