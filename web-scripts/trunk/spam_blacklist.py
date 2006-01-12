#!/usr/bin/python

# updates the spam blacklist

# this runs locally, and not on SourceForge shell sever.
# SourceForge shell server doesn't allow outbound connections.
# on SourceForge server side, it runs spam_blacklist.sh

from urllib import urlopen
from tempfile import mkstemp
from os import unlink, system, write, close
from sys import exit

blacklist = urlopen('http://blacklist.chongqed.org/').read().replace('https?:\/\/([^\/]*\.)?', '').replace('\\', '')

badsigns = r'|\*$^[]()'

for b in badsigns:
	if blacklist.find(b) >= 0:
		print 'black list contains regex'
		exit(1)

tfd, t = mkstemp()
write(tfd, blacklist)
close(tfd)

system('cat %s | ssh -l kichik -i spam_blacklist.key nsis.sf.net 2>&1 | grep -v "Pseudo-terminal"' % t)

unlink(t)
