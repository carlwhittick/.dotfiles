#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)


./backup.sh

./packages/setup.sh
./tmux/setup.sh
./neovim/setup.sh
./sxhkd/setup.sh
