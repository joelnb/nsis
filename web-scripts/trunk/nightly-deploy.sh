#/bin/bash

#
# nightly build deploymet script
#   runs on sf shell server after build is done and copied
#
# need this in ~/.ssh/authorized_keys
#   command="/home/project-web/nsis/bin/nightly-deploy.sh",no-port-forwarding,no-x11-forwarding,no-agent-forwarding ssh-ed25519 AAAAC3...

set -ex

cd /home/project-web/nsis/bin

# unzip built files
cat > nsis.zip
rm -rf unzipped
mkdir unzipped
unzip nsis.zip -d unzipped
mv unzipped/nsis-* unzipped/nsis

# some constants
DISTROOT=unzipped/nsis
BASEROOT=$PWD
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
cp -f unzipped/build.log $NIGHTLYROOT/build.log
rsync -vaW --delete $DISTROOT/Docs/ $NIGHTLYROOT/Docs/
rsync -vaW --delete $DISTROOT/Examples/ $NIGHTLYROOT/Examples/
rsync -vaW --delete $DISTROOT/Include/ $NIGHTLYROOT/Include/
rsync -vaW --delete $DISTROOT/Contrib/ $NIGHTLYROOT/Contrib/
