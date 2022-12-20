#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)
DATE_TIME=$(date +'%m-%d-%Y_%T')
BACKUP_DIR=$BASE_DIR/backups/$DATE_TIME

#############################
# Make the backup directory #
#############################
mkdir -p $BACKUP_DIR

cp $HOME/.tmux.conf $BACKUP_DIR 2>/dev/null

mv $HOME/.config/nvim $BACKUP_DIR/nvim_config 2>/dev/null
# mv $HOME/.local/share/nvim $BACKUP_DIR/nvim_share 2>/dev/null

cp $HOME/.config/sxhkd/sxhkdrc $BACKUP_DIR 2>/dev/null
cp $HOME/bin/sxhkd/push-to-talk $BACKUP_DIR 2>/dev/null
