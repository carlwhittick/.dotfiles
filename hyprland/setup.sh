#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

chmod +x $BASE_DIR/wrappedhl

ln -sf $BASE_DIR/hypr $HOME/.config/hypr
ln -sf $BASE_DIR/wrappedhl $HOME/.local/bin/wrappedhl
ln -sf $BASE_DIR/wrappedhl.desktop /usr/share/wayland-sessions/wrappedhl.desktop
