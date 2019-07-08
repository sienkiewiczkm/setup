#/usr/bin/env bash

rm ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json
rm -r ~/Library/Application\ Support/Code/User/snippets

pushd "`dirname "$0"`"
ln -s $(pwd)/../config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $(pwd)/../config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s $(pwd)/../config/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
popd

