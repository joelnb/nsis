#!/bin/bash

# this runs on the shell server
# spam_blacklist.py runs locally

T=`mktemp`

chgrp nsis $T
chmod 664 $T

cat > $T || exit 1

mv -f $T /home/groups/n/ns/nsis/htdocs/mediawiki/spam_blacklist

