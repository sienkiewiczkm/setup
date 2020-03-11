source "${HOME}/.zgen/zgen.zsh"  # https://github.com/tarjoilija/zgen

if ! zgen saved; then
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/command-not-found  # provide suggested packages to be installed if a command cannot be found
  zgen oh-my-zsh plugins/sudo  # prefix your current or previous commands with sudo by pressing esc twice

  zgen load denysdovhan/spaceship-prompt spaceship
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  zgen save
fi

# oh-my-zsh
DISABLE_AUTO_TITLE=true

SPACESHIP_BATTERY_SHOW=true
SPACESHIP_BATTERY_THRESHOLD=75
SPACESHIP_EXEC_TIME_ELAPSED=5
SPACESHIP_TIME_SHOW=true
SPACESHIP_EXIT_CODE_SHOW=true

# initialize completions
autoload -U compinit && compinit

# Default tools
export EDITOR=nvim
export VISUAL=nvim

# Editing longs commands in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^xx" edit-command-line
bindkey "^x^x" edit-command-line

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Aliases
alias ..='cd ../'
alias e='exa'

# fuzzy branch checkout
alias gs='git branch | fzf | head -n1 | xargs git switch'
alias gsl='git branch -a | fzf | head -n1 | sed "s/remotes\/origin\///g" | xargs git switch'

# git rev-parse --abbrev-ref HEAD => should be master
alias git-clean-branches="git fetch -p | git branch -vv | grep ': gone]' | awk '{print $1}' | vipe | xargs -n1 git branch -D"


# Source work configuration files (may contain client secrets)
# (N) removes `zsh: no matches found` warning
for cfgFile in ~/.zshrc.work.*(N) ; do
  source "$cfgFile"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(~/.completions $fpath)
