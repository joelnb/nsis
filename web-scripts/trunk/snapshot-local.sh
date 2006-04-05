#!/bin/bash

# NSIS nightly snapshot

# this runs locally to not overload SourceForge shell servers.
# on SourceForge server side, it runs snapshot.sh

cd /home/kichik/c

cvs -Q -d:pserver:anonymous:@cvs.sourceforge.net:/cvsroot/nsis login > /dev/null
cvs -Q -z3 -d:pserver:anonymous:@cvs.sourceforge.net:/cvsroot/nsis co -P -d nsis-snapshot NSIS || exit 1

cd nsis-snapshot

scons.sh MSTOOLKIT=yes -k dist-zip

if [ ! -e *.zip ]; then
	cat build.log
	if zip -qr nsis.zip nsis-*; then
		echo zip built anyway
	else
		cd ..
		rm -rf nsis-snapshot
		exit 1
	fi
fi

ZIP=*.zip

zip $ZIP build.log > /dev/null

cat $ZIP | ssh -q -T -l kichik -i snapshot.key nsis.sf.net

cd ..

rm -rf nsis-snapshot

