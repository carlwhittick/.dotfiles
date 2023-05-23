#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)


./backup.sh

./packages/setup.sh
./tmux/setup.sh
./neovim/setup.sh
./sxhkd/setup.sh
./fish/setup.sh
./ranger/setup.sh
./hyprland/setup.sh
./waybar/setup.sh
./dunst/setup.sh
./nwg-drawer/setup.sh
./swaylock/setup.sh

ln -sf $BASE_DIR/alacritty.yml $HOME/.config/alacritty/alacritty.yml

./docker.sh
