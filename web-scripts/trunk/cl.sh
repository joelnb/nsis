#!/bin/sh

# updates change log

umask 0002
cd /home/groups/n/ns/nsis/bin/cvs/NSIS
../../cvsupdate.sh
../../cvs2cl.pl -f "../changelog.txt" -l "-d'>Dec 17 15:59:23 UTC 2005'" -b -g "-q"
if ! diff ../changelog.txt ../../../htdocs/nightly/changelog.htm; then
	cp ../changelog.txt ../../../htdocs/nightly/changelog.htm
fi
rm -f ../changelog.txt
