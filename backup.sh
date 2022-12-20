#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)
DATE_TIME=$(date +'%m-%d-%Y_%T')
BACKUP_DIR=$BASE_DIR/backups/$DATE_TIME

#############################
# Make the backup directory #
#############################
mkdir -p $BACKUP_DIR

cp $HOME/.tmux.conf $BACKUP_DIR 2>/dev/null
