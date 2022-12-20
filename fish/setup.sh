#!/bin/bash

BASEDIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

########################
# Set as default shell #
########################
if ! grep -q "/bin/fish" /etc/shells; then
  echo /bin/fish | sudo tee -a /etc/shells
fi

sudo chsh -s /bin/fish

curl -sL https://git.io/fisher | source
set -x PATH $HOME/.config/fish/functions $PATH
set -gx fish_user_paths $fish_user_paths $HOME/.config/fish/functions

fisher install jorgebucaran/fisher
fisher install jethrokuan/z
fisher install jorgebucaran/autopair.fish
fisher install PatrickF1/fzf.fish

source $HOME/.config/fish/config.fish

##################
# Symlink config #
##################
mkdir -p $HOME/.config/fish
ln -sf $BASEDIR/config.fish $HOME/.config/fish/config.fish
