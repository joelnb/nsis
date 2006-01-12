#!/bin/sh

# downloads forum feed and transforms it to html

# this runs on SourceForge shell servers.
# forumrss-local.sh runs locally.

cat > /home/groups/n/ns/nsis/forum.rss
xsltproc /home/groups/n/ns/nsis/bin/forumrss.xsl /home/groups/n/ns/nsis/forum.rss | tail -n 1 > /home/groups/n/ns/nsis/forum.rss.html

#wget -q -O /home/groups/n/ns/nsis/forum.rss "http://forums.winamp.com/backend.php?forumid=65&limit=5"
