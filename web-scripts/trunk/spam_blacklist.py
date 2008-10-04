#!/usr/bin/python

# prints an updated spam blacklist

from urllib import urlopen
from tempfile import mkstemp
from os import unlink, system, write, close
from sys import exit

blacklist = urlopen('http://blacklist.chongqed.org/').read().replace('https?:\/\/([^\/]*\.)?', '').replace('\\', '')

badsigns = r'|\*$^[]()'

if 'http' not in blacklist or '<pre>' in blacklist:
	print 'invalid blacklist'
	exit(1)

for b in badsigns:
	if blacklist.find(b) >= 0:
		print 'black list contains regex'
		exit(1)

print blacklist
