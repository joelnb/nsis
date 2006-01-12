#!/bin/bash

# remotely executed cron script
# SourceForge cron daemon was disabled

scriptdir=`dirname $0`

$scriptdir/cl.sh > /dev/null 2>&1
$scriptdir/nsisweb.sh > /dev/null 2>&1
$scriptdir/newsrss.sh

touch $scriptdir/cron_this.last_run
