#/bin/bash

#
# nightly build deploymet script
#   runs on sf shell server after build is done and copied
#

# unzip built files
mkdir unzipped
unzip nsis*.zip -d unzipped
mv unzipped/nsis-* unzipped/nsis

# some constants
DISTROOT=unzipped/nsis
BASEROOT=$PWD/web-scripts
NIGHTLYROOT=$PWD/../htdocs/nightly/

# fix-up docs
cp $DISTROOT/Docs/Contents.html $DISTROOT/Docs/index.html
$BASEROOT/sflogoadder.sh $DISTROOT/Docs

echo Options +indexes > $DISTROOT/Docs/.htaccess
echo Options +indexes > $DISTROOT/Examples/.htaccess
echo Options +indexes > $DISTROOT/Include/.htaccess
echo Options +indexes > $DISTROOT/Contrib/.htaccess

# copy filse around
cp -f nsis*.zip $NIGHTLYROOT/nsis.zip
cp -f build.log $NIGHTLYROOT/build.log
rsync -vaW --delete $DISTROOT/Docs/ $NIGHTLYROOT/Docs/
rsync -vaW --delete $DISTROOT/Examples/ $NIGHTLYROOT/Examples/
rsync -vaW --delete $DISTROOT/Include/ $NIGHTLYROOT/Include/
rsync -vaW --delete $DISTROOT/Contrib/ $NIGHTLYROOT/Contrib/
