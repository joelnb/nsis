#!/bin/bash

# backups the website

# this runs locally, and not on sourceforge shell sever.
# on sourceforge server side, this runs backup.sh.

F=~/nsisweb-backup/`date +%d-%B-%Y`.tar.bz2

touch $F
chmod 600 $F

ssh -q -T -l kichik -i backup.key nsis.sf.net > $F
