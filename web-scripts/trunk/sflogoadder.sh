#!/bin/sh

# adds SourceForge logo to all documentation files

DOCS=$1/*.html

for doc in $DOCS; do
	sed -ie 's!</body>!<a href="http://sourceforge.net"><img border=0 src="http://sourceforge.net/sflogo.php?group_id=22049\&amp;type=1" alt="SourceForge Logo" /></a></body>!' $doc
	sed -ie 's!<body>!<body><b style="color: red">Note: </b> this documentation is for the latest development version. Some commands may not yet be available in the released version.<hr />!' $doc
done
