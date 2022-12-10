# setup

- [setup](#setup)
  - [Basics](#basics)
  - [MacOS configuration](#macos-configuration)
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

## MacOS configuration

Install [Homebrew](https://brew.sh/) and run `brew bundle`.

Setup kitty just like on Ubuntu.

Setup zsh just like on Ubuntu.

Install [nvm](https://github.com/nvm-sh/nvm) and Node using `nvm`: `nvm install node`.

Setup itsycal, format: `E dd/MM/YYYY (MMM)`

## Ubuntu configuration

### Installation

**Before** you install Ubuntu on a new machine:

- Ensure you have an Ethernet cable. WiFi may not work initially without updates/proper drivers.

Install Ubuntu with recommended settings, encrypt home if possible. If you'll skip encryption you can do it later, just follow [this guide on www.howtogeek.com](https://www.howtogeek.com/116032/how-to-encrypt-your-home-folder-after-installing-ubuntu/).

Once installed, update packages:

```Bash
sudo apt update         # update package index
sudo apt upgrade        # download & install packages
sudo do-release-upgrade # upgrade to newest release
```

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

5. On dekstops, Settings > Power > Blank screen option: set to Never. Alternatively run in the terminal: `

6. Set org.gnome.desktop.interface.clock-show-weekday to true

### Minimal `ssh` setup

1. [`zsh`](#zsh)
2. [`git`](#git)


### Install software & configurations

#### Install `apt` dependencies.

```Bash
ubuntu_apt_list=(
  clementine # audio player
  cmake
  dconf-monitor # configuration tool, see 'System configuration'
  fzf # fuzzy search
  gimp
  git
  gitk # graphical history viewer for git
  gnome-tweak-package # tweaks for Gnome, see 'System configuration'
  gpick # color picker
  htop # fancy top
  imagemagick # image manipulation toolset
  kitty # terminal emulator
  moreutils # chronic, vipe, parallel and more (https://joeyh.name/code/moreutils/)
  net-tools # ifconfig (deprecated, use ip tool, for IP: ip -c a)
  python3-pip
  python3-venv
  silversearcher-ag # faster alternative for grep
)

sudo apt install ${ubuntu_apt_list[*]}
```

#### Install `snap` dependencies.

```Bash
snap_install_list=(
  discord
  spotify
)

sudo snap install ${snap_install_list[*]}

# classic snaps:
#   code # Visual Studio Code
```

#### Install Rust

Follow the instructions on [https://rustup.rs/](https://rustup.rs/)

```Bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### Install exfat drivers

[How to mount an exfat drive on Ubuntu via fosslinux.com](https://www.fosslinux.com/17725/how-to-mount-an-exfat-drive-on-ubuntu.htm):

```Bash
sudo add-apt-repository universe
sudo apt update
sudo apt install exfat-fuse exfat-utils
```


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
| imagemagick        | image toolset, used by kitty            |                                             |
| zsh                | shell                                   |                                             |

### `nvim`

Create symlink:

```Bash
ln -s /home/kamil/code/setup/config/nvim ~/.config/nvim 
```

Install `vim-plug` for plugins:

```Bash
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run `nvim`, run `:PlugInstall`. Close `nvim`. Ready for use.

#### `kitty`

Install `kitty`:

```Bash
sudo apt install kitty

# link the configurations
ln -sv /home/kamil/code/setup/config/kitty ~/.config/kitty
ln -sv /home/kamil/code/setup/config/kitty/dracula-kitty ~/.config/kitty
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
# on mac: ~/Library/Application Support/Code/User/settings.json etc
ln -s $(pwd)/vscode/settings.json ~/.config/Code/User/settings.json
ln -s $(pwd)/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s $(pwd)/vscode/snippets ~/.config/Code/User/snippets
# Install extensions
cat vscode/extensions.txt | xargs -n1 code --install-extension
```

### FAQ

#### Ubuntu changes Windows clock and vice versa

Ubuntu stores clock time in UTC, Windows doesn't. You have to fix one of them, to force Ubuntu to use local time use:

```Bash
timedatectl set-local-rtc 1 --adjust-system-clock
```

#### Bluetooth devices do not work correctly on dual boot (Windows + Linux)

Bluetooth pairing generates unique key during pairing and re-pairing on another system overrides this key, after reboot keys do not match. See the guide for fix: https://unix.stackexchange.com/q/255509
