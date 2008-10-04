#!/bin/bash

# this runs on the shell server
# backup-local.sh runs locally

# make sure no-pty is used in authorized_keys
# if it isn't used, file transfers will be corrupted

TMP=`mktemp`

cd /tmp/persistent/nsiswikiimages

mysqldump --quick --databases n22049_wiki n22049_archive | grep -v "^INSERT INTO wiki_objectcache VALUES" > mysql_dump

tar cj --exclude=temp --exclude=thumb * > $TMP

rm -f mysql_dump

cat $TMP

rm -f $TMP
