#!/usr/bin/env bash

# TODO: Ensure tmux is installed

# TODO: Delete old configuration and move it to backup directory

# Create symlink for the configuration
pushd "`dirname "$0"`/../config"
ln -s $(pwd)/tmux/tmux ~/.tmux.conf
popd
