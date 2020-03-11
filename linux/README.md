# Ubuntu configuration

Clone this repo to `~/setup`. This guide will assume this location.

## Before you install Ubuntu on a new machine

* Prior to installation ensure you have an Ethernet cable. WiFi may not work initially without updates/proper drivers.

## Minimal `ssh` setup

1. [`zsh`](#zsh)
2. [`git`](#git)


## Install software & configurations

### Package list

| Package            | Description                             | URL                                         |
| ------------------ | --------------------------------------- | ------------------------------------------- |
| alacritty          | terminal emulator                       | https://github.com/jwilm/alacritty          |
| curl               |                                         |                                             |
| git                |                                         |                                             |
| gnome-tweak-tool   | system tweaks: keyboard re-mapping etc. |                                             |
| neovim             |                                         |                                             |
| nodejs             |                                         | https://github.com/nodesource/distributions |
| tmux               |                                         |                                             |
| virtual box        |                                         |                                             |
| virtualenv         |                                         |                                             |
| visual studio code |                                         |                                             |
| xclip              | clipboard support                       |                                             |
| zsh                | shell                                   |                                             |

### `zsh`

```Bash
sudo apt install zsh
chsh -s /usr/bin/zsh $(whoami)
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
ln -s /home/$(whoami)/setup/config/zsh/.zshrc ~/.zshrc
```

### `git`

```Bash
sudo apt install git

git config --global user.name "first and last name"
git config --global user.email "email address"
```

Open `~/.gitconfig` and append the following:

```ini
[include]
  path = /home/<USER>/setup/config/git/git
```

Setup password caching in `git`. Follow GitHub official guide [here](https://help.github.com/en/github/using-git/caching-your-github-password-in-git), likely you want:

```Bash
# 1h = 60 * 60s = 3600s
# 8h = 8 * 60 * 60s = 28800s
git config --global credential.helper 'cache --timeout=28800'
```

Setup pager, for `zsh` the following is fine:

```Bash
git config --global core.pager "less -F -X"
```

### Visual Studio Code

```Bash
cd ./setup/config

# -- Visual Studio Code
# Make symlinks
ln -s $(pwd)/vscode/settings.json ~/.config/Code/User/settings.json
ln -s $(pwd)/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s $(pwd)/vscode/snippets ~/.config/Code/User/snippets
# Install extensions
cat vscode/extensions.txt | xargs -n1 code --install-extension
```

## Notes

Install Ubuntu with recommended settings, encrypt home if possible.

Setup encryption of home folder if skipped:
[Guide](https://www.howtogeek.com/116032/how-to-encrypt-your-home-folder-after-installing-ubuntu/)

Create SSH key for git, ssh etc.

```sh
  ssh-keygen -t rsa -b 4096 -C "youremail@example.com"  # generate keys
  eval "$(ssh-agent -s)"  # start ssh-agent in the background
  ssh-add ~/.ssh/id_rsa  # add key
```

Remap caps lock to ctrl using "Tweaks" tool (package gnome-tweak-tool)

Install some better fonts [nerd fonts](https://github.com/ryanoasis/nerd-fonts/), download, place in `~/.fonts` and run `fc-cache -fv` to rebuild the font cache.
