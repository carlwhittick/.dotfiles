#!/bin/bash

BASE_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}") && pwd)

get_latest_github_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

#################################
# Install SouceCodePro NerdFont #
#################################
mkdir -p $HOME/.local/share/fonts

LATEST_RELEASE_VERSION=$(get_latest_github_release "ryanoasis/nerd-fonts")

# Only download a new version if it doesn't match the old one
if test -f $HOME/.local/share/fonts/SourceCodePro/version && [ "$(cat $HOME/.local/share/fonts/SourceCodePro/version)" == "$LATEST_RELEASE_VERSION" ]; then
  echo "Already up to date."
else
  mkdir -p $HOME/.local/share/fonts/SourceCodePro
  curl -o /tmp/SourceCodePro.zip -L https://github.com/ryanoasis/nerd-fonts/releases/download/$LATEST_RELEASE_VERSION/SourceCodePro.zip
  # Use the freshen option to only replace new files on extract
  unzip -f /tmp/SourceCodePro.zip -d $HOME/.local/share/fonts/SourceCodePro
  echo $LATEST_RELEASE_VERSION > $HOME/.local/share/fonts/SourceCodePro/version
fi

# Refresh the font cache
fc-cache

###################
# Setup Astronvim #
###################

# Install Astronvim base
if [ -d "$BASE_DIR/nvim" ]; then
  git -C "$BASE_DIR/nvim" pull
else
  git clone https://github.com/AstroNvim/AstroNvim $BASE_DIR/nvim
fi

# Install custom Astronvim config
if [ -d "$BASE_DIR/nvim/lua/user" ]; then
  git -C "$BASE_DIR/nvim/lua/user" pull
else
  git clone https://github.com/carlwhittick/astronvim_config $BASE_DIR/nvim/lua/user
fi

############
# Symlinks #
############
sudo ln -sf $BASE_DIR/nvim $HOME/.config/nvim
