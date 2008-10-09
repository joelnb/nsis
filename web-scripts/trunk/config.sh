#!/bin/sh

SFSERV=web.sourceforge.net
SFUSER=XXXX_USERNAME_XXXX,nsis
SFKEY=XXXX_PATH_TO_PRIVATE_KEY_XXX
SFDIR=/home/groups/n/ns/nsis

SVNROOT=https://nsis.svn.sourceforge.net/svnroot/nsis/NSIS/

_RSYNC="rsync -rz --delay-updates --rsh=\"ssh -l $SFUSER -i $SFKEY\""
RSYNC="eval $_RSYNC"

WINEROOT=~/c
SCONS=~/bin/scons.sh
