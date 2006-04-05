#!/bin/sh

# downloads forum feed and transforms it to html

# this runs locally, and not on SourceForge shell sever.
# SourceForge shell server doesn't allow outbound connections.
# on SourceForge server side, it runs forumrss.sh

wget -q -O /tmp/forum.rss "http://forums.winamp.com/backend.php?forumid=65&limit=5"
if [ -e /tmp/forum.rss ]; then
	cat /tmp/forum.rss | ssh -q -T -l kichik -i forumrss.key nsis.sf.net
fi

rm /tmp/forum.rss

F=`mktemp`
wget -q -O $F "http://nsis.sourceforge.net/Main_Page?action=purge"
rm -f $F
