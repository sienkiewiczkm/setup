# Guide for MacOSX setup

* [ ] Install Xcode command line tools: `xcode-select --install`
* [ ] Set modifier keys for keyboard: set Caps Lock to Control (Settings > Keyboard > Modifier keys)
* [ ] Generate new SSH keys and add them to the agent ([GitHub guide](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))
* [ ] Install [Homebrew](http://brew.sh)
  * [ ] (?) Problems with permissions may occur, use: `sudo chown -R $(whoami) $(brew --prefix)/*`
  * [ ] Add taps:
    * [ ] `brew tap homebrew/cask-fonts`
* [ ] Install using Homebrew:
  * normal
    * [ ] zsh
    * [ ] neovim
    * [ ] tmux
    * [ ] python
    * [ ] python@2
    * [ ] node
  * casks
    * [ ] iterm2
    * [ ] visual-studio-code
    * [ ] firefox
    * [ ] google-chrome
    * [ ] virtualbox
    * [ ] virtualbox-extension-pack
    * [ ] Fonts
      * [ ] font-hack-nerd-font
      * [ ] font-iosevka-nerd-font-mono
      * [ ] font-iosevka-nerd-font
* [ ] Install using pip
  * [ ] virtualenv
  * [ ] virtualenvwrapper
* [ ] Set git `user.name` and `user.email`, eg: `git config --global user.name "Kamil Sienkiewicz"`
* [ ] Set up ZSH
  * [ ] Install zgen: `git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"`
  * [ ] Load zgen in `.zshrc`: `source "${HOME}/.zgen/zgen.zsh"`
  * [ ] Set default shell
    * [ ] Add `/usr/local/bin/zsh` to `/etc/shells`
    * [ ] `chsh -s /usr/local/bin/zsh`
* [ ] Reboot