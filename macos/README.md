# MacOS Configuration

This directory contains automated scripts for MacOS system setup and guides specific to this system.

## Automated install sketch

```Bash
# clone the setup repository
# install homebrew
# run scripts in macros/ directory starting from brew.sh
# ensure `/etc/shells` contains `$(which zsh)` (eg. `/usr/local/bin/zsh`)
# bash -c 'echo "$(which zsh)" >> /etc/shells'
chsh -s "$(which zsh)" "$(wh


# Set default screenshots directory to separate folder
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots/
```

## Manual tasks

* [ ] Install Xcode command line tools: `xcode-select --install`

* [ ] Set up SSH keys ([GitHub guide](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))

* [ ] Install [Homebrew](http://brew.sh)
  * [ ] Run `setup/macos/brew.sh`. Note: may ask for password multiple times.

* [ ] Install tools from pip
  * [ ] virtualenv

* [ ] Set up `zsh`
  * [ ] After running brew, ZSH should be installed. 
  * [ ] Set default shell
    * [ ] Add `/usr/local/bin/zsh` to `/etc/shells` (check `which zsh`)
    * [ ] `chsh -s /usr/local/bin/zsh`
  * [ ] Install zgen: `git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"`
  * [ ] Symlink zgen: `ln -sv ${pwd}/config/zsh/zgen ~/.zgen`
  * [ ] Symlink .zshrc

* [ ] Set up `git`
  * [ ] Set `user.name`, eg: `git config --global user.name "Kamil Sienkiewicz"`
  * [ ] Set `user.email`, eg: `git config --global user.email "sienkiewiczkm@gmail.com"`

* [ ] Set up other tools
  * [ ] Set **iTerm** color scheme to [Dracula](https://draculatheme.com/iterm/)

* [ ] Setup MacOS preferences
  * [ ] Keyboard
    * [ ] Set modifier keys for **all** keyboards: map Caps Lock to Control (in *Modifier keys*)
    * [ ] Disable *Add full stop with double space* in *Text settings*
  * [ ] Mission Control
    * [ ] Uncheck *Automatically rearrange Spaces based on most recent use*.
    * [ ] Check *Group windows by application*
  * [ ] Security and Privacy
    * [ ] Set timeout for password requirement to *immediately*.
    * [ ] Ensure FileVault is enabled.
  * [ ] Finder
    * [ ] View > Show Path Bar
    * [ ] View > Show Status Bar
  * [ ] Menu bar
    * [ ] Battery > Show percentage
  * [ ] Enable key repeating
    * [ ] `defaults write -g ApplePressAndHoldEnabled -bool false`
    * [ ] `defaults write -g InitialKeyRepeat -int 10` - normal minimum is 15 (225 ms)`
    * [ ] `defaults write -g KeyRepeat -int 1` - normal minimum is 2 (30 ms)

* [ ] Reboot
