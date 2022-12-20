#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

pacman -Qq > /tmp/installed-pacman-packages
yay -Qq > /tmp/installed-yay-packages

###########################
# Install Pacman packages #
###########################
cat $BASE_DIR/pacman.list | grep -vxFf /tmp/installed-pacman-packages | xargs -r sudo pacman -S --noconfirm

########################
# Install Yay packages #
########################
cat $BASE_DIR/yay.list | grep -vxFf /tmp/installed-yay-packages | xargs -r yay -S --noconfirm
