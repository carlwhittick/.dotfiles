#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

ln -sf $BASE_DIR/ranger $HOME/.config/ranger
