source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/command-not-found

  zgen load denysdovhan/spaceship-prompt spaceship
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

SPACESHIP_BATTERY_SHOW=always
SPACESHIP_EXEC_TIME_ELAPSED=5
SPACESHIP_TIME_SHOW=true

export LANG=en_US.UTF-8

