#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

#################################
# Install SouceCodePro NerdFont #
#################################
mkdir -p ~/.local/share/fonts

LATEST_RELEASE_VERSION=$(get_latest_github_release "ryanoasis/nerd-fonts")

# Only download a new version if it doesn't match the old one
if test -f ~/.local/share/fonts/SourceCodePro/version && [ "$(cat ~/.local/share/fonts/SourceCodePro/version)" == "$LATEST_RELEASE_VERSION" ]; then
  echo "Already up to date"
else
  mkdir -p ~/.local/share/fonts/SourceCodePro
  curl -o /tmp/SourceCodePro.zip -L https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST_RELEASE_VERSION/SourceCodePro.zip
  # Use the freshen option to only replace new files on extract
  unzip -f /tmp/SourceCodePro.zip -d ~/.local/share/fonts/SourceCodePro
  echo $LATEST_RELEASE_VERSION > ~/.local/share/fonts/SourceCodePro/version
fi

# Refresh the font cache
fc-cache

###################
# Setup Astronvim #
###################

# Install Astronvim base
if [ -d "$BASE_DIR/neovim/nvim" ]; then
  git -C "$BASE_DIR/neovim/nvim" pull
else
  git clone https://github.com/AstroNvim/AstroNvim $BASE_DIR/neovim/nvim
fi

# Install custom Astronvim config
git clone https://github.com/carlwhittick/astronvim_config $BASE_DIR/neovim/nvim/lua/user
if [ -d "$BASE_DIR/neovim/nvim/lua/user" ]; then
  git -C "$BASE_DIR/neovim/nvim/lua/user" pull
else
  git clone https://github.com/carlwhittick/astronvim_config $BASE_DIR/neovim/nvim/lua/user
fi

############
# Symlinks #
############
sudo ln -sf $BASE_DIR/neovim/nvim $HOME/.config/nvim
