#!/bin/bash

# builds and uploads the nightly snapshot

BASEDIR=`dirname $0`

source $BASEDIR/config.sh

# local vars

SNAPSHOTROOT=$WINEROOT/nsis-snapshot
ROOTWINE=C:\\nsis-snapshot
DISTROOTWINE=$ROOTWINE\\dist
DISTROOT=$SNAPSHOTROOT/dist

# remote vars

NIGHTLY=$SFDIR/htdocs/nightly

# export a fresh copy

svn -q export $SVNROOT/trunk $WINEROOT/nsis-snapshot || exit 1

# build

cd $WINEROOT
$SCONS -C $SNAPSHOTROOT MSTOOLKIT=yes PREFIX=$DISTROOTWINE -k install dist-zip '>' $ROOTWINE\\build.log '2>&1' > /dev/null
mv $SNAPSHOTROOT/*.zip $SNAPSHOTROOT/nsis.zip || exit 1

# fix-up docs

cp $DISTROOT/Docs/Contents.html $DISTROOT/Docs/index.html
$BASEDIR/sflogoadder.sh $DISTROOT/Docs

# add .htaccess

echo Options +indexes > $DISTROOT/Docs/.htaccess
echo Options +indexes > $DISTROOT/Examples/.htaccess
echo Options +indexes > $DISTROOT/Include/.htaccess

# upload everything using rsync

$RSYNC $SNAPSHOTROOT/build.log $SNAPSHOTROOT/nsis.zip $DISTROOT/Docs $DISTROOT/Examples $DISTROOT/Include $SFSERV:$NIGHTLY

# delete local snapshot directory

rm -rf $WINEROOT/nsis-snapshot
