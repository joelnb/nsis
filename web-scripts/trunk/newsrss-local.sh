#!/bin/sh

# downloads news feed, transforms it to html and uploads

RSSTMP=`mktemp`
BASEDIR=`dirname $0`

source $BASEDIR/config.sh

if wget -q -O $RSSTMP "https://sourceforge.net/p/nsis/news/feed.rss"; then
        if xsltproc $BASEDIR/newsrss.xsl $RSSTMP | tail -n +2 > $RSSTMP.html; then
                cp $RSSTMP.html $SFDIR/news.rss.html
        fi
fi

rm -f $RSSTMP
rm -f $RSSTMP.html
