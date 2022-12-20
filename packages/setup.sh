#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

###########################
# Install Pacman packages #
###########################
cat $BASE_DIR/pacman.list | grep -vxFf <(pacman -Qq) | xargs sudo pacman -S --noconfirm

########################
# Install Yay packages #
########################
cat $BASE_DIR/yay.list | grep -vxFf <(pacman -Qq) | xargs yay -S --noconfirm
