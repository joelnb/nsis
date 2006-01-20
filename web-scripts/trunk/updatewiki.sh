#!/bin/bash

# updates mediawiki version
#
# usage example:
#   updatewiki.sh 1.5.5

cd /home/groups/n/ns/nsis/htdocs

wget http://osdn.dl.sourceforge.net/sourceforge/wikipedia/mediawiki-$1.tar.gz || exit 1
tar xzf mediawiki-$1.tar.gz || exit 1
rm -f mediawiki-$1.tar.gz

rm -rf mediawiki-$1/config

cp -rf mediawiki/extensions/* mediawiki-$1/extensions

cp -r mediawiki/skins/nsis mediawiki-$1/skins
cp mediawiki/skins/NSIS.php mediawiki-$1/skins

cp mediawiki/.htaccess mediawiki-$1

cp mediawiki/spam_blacklist mediawiki-$1

cp mediawiki/LocalSettings.php mediawiki-$1
cp mediawiki/AdminSettings.php mediawiki-$1

sed -s "s/\([ \t]*NS_IMAGE[ \t]*=>[ \t]*'\)Image\(',\)/\1File\2/;s/\([ \t]*NS_IMAGE_TALK[ \t]*=>[ \t]*'\)Image\(_talk',\)/\1File\2/" mediawiki-$1/languages/Language.php > mediawiki-$1/languages/Language.php.sed
mv -f mediawiki-$1/languages/Language.php.sed mediawiki-$1/languages/Language.php

chgrp -R nsis mediawiki-$1
chmod -R g+w mediawiki-$1

rm -rf mediawiki-$1/images
ln -s /tmp/persistent/nsiswikiimages mediawiki-$1/images

diff -ruNw mediawiki mediawiki-$1 > wiki.diff

echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=Main_Page&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=Change_Log&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=Special:Version&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=ExtractDLL&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=File:Extractdll.zip&action=purge"
echo
echo "http://nsis.sourceforge.net/wiki.diff"

read -n1 -p "Use new Wiki? [Y/n] " -e USE_NEW_WIKI

if [ "$USE_NEW_WIKI" == '' -o "$USE_NEW_WIKI" == 'y' -o "$USE_NEW_WIKI" == 'Y' ]; then
	mv mediawiki ../mediawiki-$1-old
	mv mediawiki-$1 mediawiki
fi

rm -f wiki.diff
