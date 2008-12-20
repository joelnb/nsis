#!/bin/bash

# updates mediawiki version
#
# usage example:
#   updatewiki.sh 1.13 1.13.3
# or, for local updates:
#   updatewiki.sh 1.13 1.13.3 mediawiki-1.13.3.tar.gz

cd /home/groups/n/ns/nsis/htdocs

if [ -n "$3" ]; then
	if [ -f "$2" ]; then
		tar xzf $3 || exit 1
		rm -f $3
	else
		echo "$3 cannot be found!"
		exit 1
	fi
else
	wget http://download.wikimedia.org/mediawiki/$1/mediawiki-$2.tar.gz || exit 1
	tar xzf mediawiki-$2.tar.gz || exit 1
	rm -f mediawiki-$2.tar.gz
fi

rm -rf mediawiki-$2/config

cp -rf mediawiki/extensions/* mediawiki-$2/extensions

cp -r mediawiki/skins/nsis mediawiki-$2/skins
cp mediawiki/skins/NSIS.php mediawiki-$2/skins

cp mediawiki/.htaccess mediawiki-$2

cp mediawiki/spam_blacklist mediawiki-$2

cp mediawiki/LocalSettings.php mediawiki-$2
cp mediawiki/AdminSettings.php mediawiki-$2

sed -s "s/\([ \t]*NS_IMAGE[ \t]*=>[ \t]*'\)Image\(',\)/\1File\2/;s/\([ \t]*NS_IMAGE_TALK[ \t]*=>[ \t]*'\)Image\(_talk',\)/\1File\2/" mediawiki-$2/languages/messages/MessagesEn.php > mediawiki-$2/languages/messages/MessagesEn.php.sed
mv -f mediawiki-$2/languages/messages/MessagesEn.php.sed mediawiki-$2/languages/messages/MessagesEn.php

chgrp -R nsis mediawiki-$2
chmod -R g+w mediawiki-$2

rm -rf mediawiki-$2/images
ln -s /home/groups/n/ns/nsis/persistent/mediawiki/nsiswikiimages mediawiki-$2/images

diff -ruNw mediawiki mediawiki-$2 > wiki.diff

sed -s "s/\/mediawiki/\/mediawiki-$2/" mediawiki-$2/LocalSettings.php > mediawiki-$2/LocalSettings.php.sed
mv -f mediawiki-$2/LocalSettings.php.sed mediawiki-$2/LocalSettings.php

echo "http://nsis.sourceforge.net/mediawiki-$2/index.php?title=Main_Page&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$2/index.php?title=Change_Log&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$2/index.php?title=Special:Version&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$2/index.php?title=ExtractDLL&action=purge"
echo "http://nsis.sourceforge.net/mediawiki-$2/index.php?title=File:Extractdll.zip&action=purge"
echo
echo "http://nsis.sourceforge.net/wiki.diff"

read -n1 -p "Use new Wiki? [Y/n] " -e USE_NEW_WIKI

sed -s "s/\/mediawiki-$2/\/mediawiki/" mediawiki-$2/LocalSettings.php > mediawiki-$2/LocalSettings.php.sed
mv -f mediawiki-$2/LocalSettings.php.sed mediawiki-$2/LocalSettings.php

if [ "$USE_NEW_WIKI" == '' -o "$USE_NEW_WIKI" == 'y' -o "$USE_NEW_WIKI" == 'Y' ]; then
	mv mediawiki ../mediawiki-$2-old
	mv mediawiki-$2 mediawiki
fi

rm -f wiki.diff

echo ""
echo "Don't forget to delete the backup, once you're sure everything's working"
echo "  /home/groups/n/ns/nsis/mediawiki-$2-old"
