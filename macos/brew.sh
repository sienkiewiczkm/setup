#!/usr/bin/env bash

# TODO: Install Homebrew if not installed.

# Taps
brew tap homebrew/cask-fonts

# Fonts
# -----

brew cask install font-iosevka
brew cask install font-iosevka-nerd-font
brew cask install font-iosevka-nerd-font-mono

# Software sources
# ----------------

brew install mas  # MacOS store CLI interface

# Programming
# -----------

brew install curl
brew install git  # Xcode command line tools may have old version
brew install nvim  # neovim
brew install reattach-to-user-namespace  # required by tmux config
brew install tmux
brew install wget
brew install zsh

brew cask install db-browser-for-sqlite
brew cask install iterm2
brew cask install paintbrush
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
brew cask install xquartz  # X Window System (useful for X11 forwarding)

# Utilities
# ---------

brew install fzf  # fuzzy finder
brew install exa  # ls replacement
brew install insect  # scientific calculator
brew install the_silver_searcher  # code searching tool similar to ack, with a focus on speed

brew cask install clipy  # clipboard manager
brew cask install coconutbattery  # battery status viewer
brew cask install disk-inventory-x  # disk space usage manager
brew cask install firefox
brew cask install google-chrome
brew cask install itsycal
brew cask install keepingyouawake  # GUI for `caffeinate` utility
brew cask install keka  # archives
brew cask install licecap  # screen recording (GIF)
brew cask install pencil  # mockups
brew cask install tunnelblick  # VPN client

# Entertainment & Misc
# --------------------

brew install newsboat # RSS client

brew cask install steam
brew cask install vienna  # RSS client - consider removal in favor of newsboat
brew cask install vlc

