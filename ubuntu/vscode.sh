#/usr/bin/env bash

# TODO: Check if `code` is installed. It is required to complete the process.

# TODO: Make backups somewhere
rm ~/.config/Code/User/settings.json
rm ~/.config/Code/User/keybindings.json
rm -r ~/.config/Code/User/snippets

pushd "`dirname "$0"`/../config"

# Create symlinks for settings
ln -s $(pwd)/vscode/settings.json ~/.config/Code/User/settings.json
ln -s $(pwd)/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s $(pwd)/vscode/snippets ~/.config/Code/User/snippets

# Install extensions
cat vscode/extensions.txt | xargs -n1 code --install-extension

popd

