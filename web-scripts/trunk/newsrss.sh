#!/bin/sh

# downloads news feed and transforms it to html

wget -q -O /home/groups/n/ns/nsis/news.rss "http://sourceforge.net/export/rss2_projnews.php?group_id=22049&rss_fulltext=1&rss_limit=2"
xsltproc /home/groups/n/ns/nsis/bin/newsrss.xsl /home/groups/n/ns/nsis/news.rss | tail -n 1 > /home/groups/n/ns/nsis/news.rss.html
