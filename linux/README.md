# Ubuntu configuration

## Minimal `ssh` setup

```Bash
# clone this repo first to ~/setup
sudo apt install zsh
chsh -s /usr/bin/zsh <user>
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
ln -s /home/<user>/setup/config/zsh/.zshrc ~/.zshrc
```

## Notes

Prior to installation ensure you have a ethernet cable, wifi may not work initially

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
