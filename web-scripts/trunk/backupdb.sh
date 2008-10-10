#!/bin/bash

# backups mysql database

BASEDIR=`dirname $0`

source $BASEDIR/config.sh

# local vars

COOKIEJAR=`mktemp`
TOKEN=`mktemp`
DBFILE=$BACKUPDIR/db-`date +%Y-%m-%d`.bz2

# commands

EXPORT="curl -s -b $COOKIEJAR -c $COOKIEJAR -u $DBUSER:$DBPASS $DBEXPORT"

# get token

$EXPORT -o $TOKEN
TOKEN=`grep token $TOKEN | sed "s/.*token=\(.\{32\}\).*/\1/"`
rm -f $TOKEN

# create export file and chmod

touch $DBFILE
chmod 600 $DBFILE

# export db

$EXPORT -o $DBFILE -d "token=$TOKEN&export_type=server&lang=utf-8&server=1&collation_connection=utf8_unicode_ci&what=sql&header_comment=&sql_compat=NONE&sql_structure=structure&sql_auto_increment=1&use_backquotes=1&sql_data=data&max_query_size=50000000&asfile=sendit&compression=bzip"
if [ $? != 0 ]; then

	echo export failed

	rm -f $DBFILE

fi

# filter out large unneeded data

touch $DBFILE.open
chmod 600 $DBFILE.open

bzgrep -v "^INSERT INTO wiki_objectcache VALUES" $DBFILE > $DBFILE.open
bzip2 -c $DBFILE.open > $DBFILE
rm -f $DBFILE.open

# delete files

rm -f $COOKIEJAR
