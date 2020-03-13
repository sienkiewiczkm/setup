# setup

- [setup](#setup)
  - [Basics](#basics)
  - [Ubuntu configuration](#ubuntu-configuration)
    - [Installation](#installation)
    - [System configuration](#system-configuration)
    - [Minimal `ssh` setup](#minimal-ssh-setup)
    - [Install software & configurations](#install-software--configurations)
      - [Package list](#package-list)
      - [`kitty`](#kitty)
      - [`zsh`](#zsh)
      - [`git`](#git)
      - [`tmux`](#tmux)
      - [Visual Studio Code](#visual-studio-code)
    - [FAQ](#faq)
      - [Bluetooth devices do not work correctly on dual boot (Windows + Linux)](#bluetooth-devices-do-not-work-correctly-on-dual-boot-windows--linux)

## Basics

1. Clone this repo to `~/setup`. This guide will assume this location in most cases.
2. Initialize submodules `git submodule update --init --recursive`.
3. Follow instructions depending on the platform.

## Ubuntu configuration

### Installation

**Before** you install Ubuntu on a new machine:

- Ensure you have an Ethernet cable. WiFi may not work initially without updates/proper drivers.

Install Ubuntu with recommended settings, encrypt home if possible. If you'll skip encryption you can do it later, just follow [this guide on www.howtogeek.com](https://www.howtogeek.com/116032/how-to-encrypt-your-home-folder-after-installing-ubuntu/).

### System configuration

1. Remap <kbd>Caps Lock</kbd> to <kbd>Ctrl</kbd> using "Tweaks" tool (from `gnome-tweak-tool` package)
2. Install better fonts like [nerd fonts](https://github.com/ryanoasis/nerd-fonts/)
    1. Download them and place in `~/.fonts`
    2. Run `fc-cache -fv` to rebuild the font cache
3. Create SSH key for `git`, `ssh` etc.

    ```sh
      ssh-keygen -t rsa -b 4096 -C "user@example.com"  # generate keys
      eval "$(ssh-agent -s)"  # start ssh-agent in the background
      ssh-add ~/.ssh/id_rsa  # add key
    ```

4. Unbind <kbd>SUPER</kbd> + <kbd>P</kbd> since it may cause problems when you are used to MacOS. [Follow the steps from Stack](https://unix.stackexchange.com/q/208682):
    1. Install `dconf-editor`.
    2. Go to `/org/gnome/mutter/keybindings/switch-monitor`
    3. Disable "Use default value".
    4. Delete: `'<Super>p',` from the input below.

### Minimal `ssh` setup

1. [`zsh`](#zsh)
2. [`git`](#git)


### Install software & configurations

#### Package list

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

#### `kitty`

Install `kitty`:

```Bash
sudo apt install kitty

# link the configurations
ln -s /home/kamil/code/setup/config/kitty ~/.config/kitty
```

#### `zsh`

```Bash
sudo apt install zsh
chsh -s /usr/bin/zsh $(whoami)
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
ln -s /home/$(whoami)/setup/config/zsh/.zshrc ~/.zshrc
```

#### `git`

Install latest `git` using [official instructions](https://git-scm.com/download/).

On Ubuntu you probably want to add apt repository:

```Bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

Set up your identity:

```Bash
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

#### `tmux`

Install `tmux` and symlink the configurations:

```Bash
ln -s /home/$(whoami)/setup/config/tmux/tmux.conf ~/.tmux.conf
```

#### Visual Studio Code

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

### FAQ

#### Bluetooth devices do not work correctly on dual boot (Windows + Linux)

Bluetooth pairing generates unique key during pairing and re-pairing on another system overrides this key, after reboot keys do not match. See the guide for fix: https://unix.stackexchange.com/q/255509
