#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)
CONFIG_FILE_PATH=$HOME/.config/sxhkd/sxhkdrc
PTT_SCRIPT_PATH=$HOME/bin/sxhkd/push-to-talk
AUTO_START_PATH=$HOME/.config/autostart/sxhkd.desktop

#############################
# Move scripts to local bin #
#############################
mkdir -p $HOME/bin/sxhkd

ln -sf $BASE_DIR/push-to-talk $PTT_SCRIPT_PATH

########################
# Move the config file #
########################
mkdir -p $HOME/.config/sxhkd

ln -sf $BASE_DIR/sxhkdrc $CONFIG_FILE_PATH

###################################
# Move the autostart desktop file #
###################################
ln -sf $BASE_DIR/push-to-talk/sxhkd.desktop $AUTO_START_PATH

sed -i "s/<USER>/$USER/" $AUTO_START_PATH
