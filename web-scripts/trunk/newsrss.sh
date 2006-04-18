#!/bin/sh

# downloads news feed and transforms it to html

if wget -q -O /home/groups/n/ns/nsis/news.rss "http://sourceforge.net/export/rss2_projnews.php?group_id=22049&rss_fulltext=1&rss_limit=3"; then
	RT=`mktemp`
	if xsltproc /home/groups/n/ns/nsis/bin/newsrss.xsl /home/groups/n/ns/nsis/news.rss > $RT; then
		tail -n 1 $RT > /home/groups/n/ns/nsis/news.rss.html
	fi
	rm -f $RT
fi
