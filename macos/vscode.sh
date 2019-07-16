#/usr/bin/env bash

# TODO: Check if `code` is installed. It is required to complete the process.

# TODO: Make backups somewhere
rm ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json
rm -r ~/Library/Application\ Support/Code/User/snippets


pushd "`dirname "$0"`/../config"

# Create symlinks for settings
ln -s $(pwd)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $(pwd)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s $(pwd)/vscode/snippets ~/Library/Application\ Support/Code/User/snippets

# Install extensions
cat vscode/extensions.txt | xargs -n1 code --install-extension

popd

