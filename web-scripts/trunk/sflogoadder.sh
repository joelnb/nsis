#!/bin/sh

# adds SourceForge logo to all documentation files

umask 0002

DOCS=/home/groups/n/ns/nsis/htdocs/Docs/*.html

for doc in $DOCS; do
	cat $doc | sed -e 's!</body>!<a href="http://sourceforge.net"><img border=0 src="http://sourceforge.net/sflogo.php?group_id=22049\&amp;type=1" alt="SourceForge Logo" /></a></body>!' > $doc.withlogo
	rm $doc
	mv $doc.withlogo $doc
	chgrp nsis $doc
done
