#!/usr/bin/env bash

# TODO: Install Homebrew if not installed.

# Software sources
# ----------------

brew install mas  # MacOS store CLI interface

# Programming
# -----------

brew install curl
brew install git
brew install neovim
brew install reattach-to-user-namespace  # required by tmux config
brew install tmux
brew install zsh

brew cask install db-browser-for-sqlite
brew cask install font-iosevka
brew cask install iterm2
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code

# Utilities
# ---------

mas install 937984704  # Amphetamine
mas install 441258766  # Magnet

brew install insect  # scientific calculator

brew cask install clipy  # clipboard manager
brew cask install coconutbattery  # battery status viewer
brew cask install disk-inventory-x  # disk space usage manager
brew cask install firefox
brew cask install google-chrome
brew cask install itsycal
brew cask install keka  # archives
brew cask install licecap  # screen recording (GIF)
brew cask install pencil  # mockups
brew cask install tunnelblick  # VPN client

# Entertainment & Misc
# --------------------

brew cask install steam
brew cask install vienna  # RSS client
brew cask install vlc

