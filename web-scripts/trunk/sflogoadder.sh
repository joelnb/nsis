#!/bin/sh

# adds SourceForge logo to all documentation files

DOCS=$1/*.html

for doc in $DOCS; do
	sed -ie 's!</body>!<a href="https://sourceforge.net"><img border=0 src="https://sourceforge.net/sflogo.php?group_id=22049\&amp;type=1" alt="SourceForge Logo" /></a></body>!' $doc
	sed -ie 's!<body>!<body background="unreleased.png">!' $doc
done

cp unreleased.png $1
