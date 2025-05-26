#! /bin/bash

# brew installs for MacOS
brew install --cask rectangle
brew install mac-mouse-fix
brew install --cask alt-tab
brew install --cask dimentium/autoraise/autoraiseapp
brew install --cask karabiner-elements
brew install vim
brew install tmux
brew install wget

# Install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.zprofile

# Install node
nvm install node
