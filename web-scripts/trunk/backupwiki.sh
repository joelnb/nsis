#!/bin/bash

# backups wiki uploaded files

BASEDIR=`dirname $0`

source $BASEDIR/config.sh

# local vars

WIKIDIR=$BACKUPDIR/wiki-`date +%Y-%m-%d`
WIKIFILE=$WIKIDIR.tar.bz2

# create folder

mkdir $WIKIDIR

# get and compress

if $RSYNC -k $SFSERV:$SFDIR/htdocs/mediawiki/images $WIKIDIR; then

	pushd $WIKIDIR/images
	tar cjf $WIKIFILE *
	popd

else

	echo rsync failed

fi

# delete temp

rm -rf $WIKIDIR
