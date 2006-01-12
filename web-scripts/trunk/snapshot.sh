#!/bin/bash

# updates the nightly snapshot

# this runs on SourceForge shell servers.
# snapshot-local.sh runs locally.

umask 0002

cd /home/groups/n/ns/nsis/htdocs/nightly
cat > new.zip
mv -f new.zip nsis.zip
unzip -qo nsis.zip build.log
chgrp nsis nsis.zip

DIR=`unzip -qql nsis.zip | head -n1 | sed -e 's/^.*\(nsis-[0-9][0-9]-...-[0-9][0-9][0-9][0-9].cvs\).*$/\1/'`
DOCS=${DIR}/Docs/\*
EXAMPLES=${DIR}/Examples/\*
INCLUDES=${DIR}/Include/\*

unzip -qqo nsis.zip $DOCS $EXAMPLES $INCLUDES || exit 1

rm -rf Docs
mv -f ${DIR}/Docs Docs
cp .htaccess Docs
chgrp -R nsis Docs
chmod -R g+w Docs
cp Docs/Contents.html Docs/index.html

rm -rf Examples
mv -f ${DIR}/Examples Examples
cp .htaccess Examples
chmod -R g+w Examples
chgrp -R nsis Examples

rm -rf Include
mv -f ${DIR}/Include Include
cp .htaccess Include
chmod -R g+w Include
chgrp -R nsis Include

rmdir $DIR

/home/groups/n/ns/nsis/bin/sflogoadder.sh
