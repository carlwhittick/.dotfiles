#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

./backup.sh

./tmux/setup.sh
./neovim/setup.sh
