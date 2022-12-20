#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)
CONFIG_FILE_PATH=$HOME/.config/sxhkd/sxhkdrc
PTT_SCRIPT_PATH=$HOME/bin/sxhkd/push-to-talk
AUTO_START_PATH=$HOME/.config/autostart/sxhkd.desktop

#############################
# Move scripts to local bin #
#############################
mkdir -p $HOME/bin/sxhkd

if ! test -L "$PTT_SCRIPT_PATH"; then
  ln -sf $BASE_DIR/push-to-talk $PTT_SCRIPT_PATH
fi

########################
# Move the config file #
########################
mkdir -p $HOME/.config/sxhkd

if ! test -L "$CONFIG_FILE_PATH"; then
  ln -sf $BASE_DIR/sxhkdrc $CONFIG_FILE_PATH
fi

###################################
# Move the autostart desktop file #
###################################
if ! test -L "$AUTO_START_PATH"; then
  ln -sf $BASE_DIR/push-to-talk/sxhkd.desktop $AUTO_START_PATH
fi

sed -i "s/<USER>/$USER/" $AUTO_START_PATH
