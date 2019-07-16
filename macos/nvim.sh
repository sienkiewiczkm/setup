#!/usr/bin/env bash

# TODO: Ensure NVIM is installed

# TODO: Delete old configuration and move it to backup directory

# Install vim-plug (https://github.com/junegunn/vim-plug)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim

# Create symlink for the configuration
pushd "`dirname "$0"`/../config"
ln -s $(pwd)/nvim ~/.config/nvim
popd
