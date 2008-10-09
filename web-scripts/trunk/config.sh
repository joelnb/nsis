#!/bin/sh

SFSERV=web.sourceforge.net
SFUSER=XXXX_USERNAME_XXXX,nsis
SFKEY=XXXX_PATH_TO_PRIVATE_KEY_XXX
SFDIR=/home/groups/n/ns/nsis

SVNROOT=https://nsis.svn.sourceforge.net/svnroot/nsis/NSIS/

DBUSER=n22049ro
DBPASS=XXXX_DB_PASSWORD_XXXX
DBEXPORT=https://mysql-n.sourceforge.net/export.php

_RSYNC="rsync -rz --delay-updates --rsh=\"ssh -l $SFUSER -i $SFKEY\""
RSYNC="eval $_RSYNC"

BACKUPDIR=~/nsisweb-backup

WINEROOT=~/c
SCONS=~/bin/scons.sh
