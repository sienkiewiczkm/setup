#!/usr/bin/env bash

# Homebrew setup
# --------------

# TODO: Install Homebrew if not installed.

brew tap homebrew/cask-fonts

# Fonts
# -----

brew cask install font-open-sans
brew cask install font-open-sans-condensed
brew cask install font-iosevka
brew cask install font-iosevka-nerd-font
brew cask install font-iosevka-nerd-font-mono

# Software sources
# ----------------

brew install mas  # MacOS store CLI interface
brew install brew-gem  # install Ruby Gems through brew

# Web browsers
# ------------

brew cask install firefox
brew cask install google-chrome

# Programming
# -----------

brew install curl
brew install git  # Xcode command line tools may have old version
brew install moreutils  # combine, sponge, ts, vipe and more
brew install nvim  # neovim
brew install python
brew install python@2
brew install reattach-to-user-namespace  # required by tmux config
brew install tmux
brew install wget
brew install sqlite  # sqlite3, command-line interface fo SQLite
brew install zsh

brew cask install db-browser-for-sqlite
brew cask install iterm2
brew cask install paintbrush
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
brew cask install xquartz  # X Window System (useful for X11 forwarding)

brew gem install tmuxinator  # easy automated tmux setup

# Utilities
# ---------

brew install exa  # ls replacement
brew install fzf  # fuzzy finder
brew install imagemagick  # image utilities (magick, convert, identify, mogrify and more)
brew install insect  # scientific calculator
brew install the_silver_searcher  # ag, code searching tool similar to ack, with a focus on speed
brew install watson  # project time tracking

brew cask install clipy  # clipboard manager
brew cask install coconutbattery  # battery status viewer
brew cask install disk-inventory-x  # disk space usage manager
brew cask install itsycal  # calendar widget for the menu bar
brew cask install keepingyouawake  # GUI for `caffeinate` utility
brew cask install keka  # archives
brew cask install licecap  # screen recording (GIF)
brew cask install pencil  # mockups
brew cask install skitch  # screenshots annotation
brew cask install tunnelblick  # VPN client

# Entertainment & Misc
# --------------------

brew install newsboat # RSS client

brew cask install anki  # flashcards
brew cask install steam
brew cask install vienna  # RSS client - consider removal in favor of newsboat
brew cask install vlc
brew cask install vox  # FLAC player


# App Store
# ---------

mas install 1295203466    # Microsoft Remote Desktop 10
mas install 441258766     # Magnet


# Under consideration / to-do list
# --------------------------------
# pyenv
# node
