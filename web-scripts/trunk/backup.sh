#!/bin/bash

BASEDIR=`dirname $0`

# backups mysql database

$BASEDIR/backupdb.sh

# backup wiki files

$BASEDIR/backupwiki.sh
