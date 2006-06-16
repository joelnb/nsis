#!/bin/bash

# updates mediawiki version
#
# usage example:
#   updatewiki.sh 1.5.5
# or, for local updates:
#   updatewiki.sh 1.5.5 mediawiki-1.5.5.tar.gz

cd /home/groups/n/ns/nsis/htdocs

if [ -n "$2" ]; then
	if [ -f "$2" ]; then
		tar xzf $2 || exit 1
		rm -f $2
	else
		echo "$2 cannot be found!"
		exit 1
	fi
else
	wget http://osdn.dl.sourceforge.net/sourceforge/wikipedia/mediawiki-$1.tar.gz || exit 1
	tar xzf mediawiki-$1.tar.gz || exit 1
	rm -f mediawiki-$1.tar.gz
fi

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

sed -s "s/\/mediawiki/\/mediawiki-$1/" mediawiki-$1/LocalSettings.php > mediawiki-$1/LocalSettings.php.sed
mv -f mediawiki-$1/LocalSettings.php.sed mediawiki-$1/LocalSettings.php

echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=Main_Page&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=Change_Log&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=Special:Version&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=ExtractDLL&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$1/index.php?title=File:Extractdll.zip&action=purge"
echo
echo "http://nsis.sourceforge.net/wiki.diff"

read -n1 -p "Use new Wiki? [Y/n] " -e USE_NEW_WIKI

sed -s "s/\/mediawiki-$1/\/mediawiki/" mediawiki-$1/LocalSettings.php > mediawiki-$1/LocalSettings.php.sed
mv -f mediawiki-$1/LocalSettings.php.sed mediawiki-$1/LocalSettings.php

if [ "$USE_NEW_WIKI" == '' -o "$USE_NEW_WIKI" == 'y' -o "$USE_NEW_WIKI" == 'Y' ]; then
	mv mediawiki ../mediawiki-$1-old
	mv mediawiki-$1 mediawiki
fi

rm -f wiki.diff

echo ""
echo "Don't forget to delete the backup, once you're sure everything's working"
echo "  /home/groups/n/ns/nsis/mediawiki-$1-old"
