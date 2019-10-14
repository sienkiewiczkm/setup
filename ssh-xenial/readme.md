# Configuration for ssh-only Xenial machines

Loose notes - this configuration guide is not complete.

```sh
sudo apt update
sudo apt upgrade

sudo apt install git
sudo apt install zsh
sudo apt install curl

chsh -s /bin/zsh

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

sudo apt-get install software-properties-common  # for add-apt-repository
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

# install vim-plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# make all symlinks
# `~/.zshrc` -> `setup/config/zsh/.zshrc`

# (manual) run nvim and run :PlugInstall

```

