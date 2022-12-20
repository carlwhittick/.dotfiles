#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

###############################
# Install tmux plugin manager #
###############################
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

############
# Symlinks #
############
sudo ln -sf $BASE_DIR/.tmux.conf $HOME/.tmux.conf

#################
# Reload config #
#################
tmux source ~/.tmux.conf
