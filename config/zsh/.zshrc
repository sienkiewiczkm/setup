source "${HOME}/.zgen/zgen.zsh"  # https://github.com/tarjoilija/zgen

# ------------------------------------------------------------------------------
# ZSH and Spaceship

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
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  rust          # Rust section
  docker        # Docker section
  venv          # virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  dir           # Current directory section
  char          # Prompt character
)

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
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=12'

# zsh options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# ------------------------------------------------------------------------------
# Aliases
alias ..='cd ../'
alias e='exa'
alias ela='exa -la'

# fuzzy branch checkout
alias gs='git branch | fzf | head -n1 | xargs git switch'
alias gsl='git branch -a | fzf | head -n1 | sed "s/remotes\/origin\///g" | xargs git switch'

# github helpers
alias prc='gh pr list | fzf | cut -f1 | xargs gh pr checkout'

# gpg helpers
alias txt='echo | vipe | tee >(pbcopy)'

# git rev-parse --abbrev-ref HEAD => should be master
alias git-clean-branches="git fetch -p | git branch -vv | grep ': gone]' | awk '{print $1}' | vipe | xargs -n1 git branch -D"

# specific for kitty terminal
alias icat="kitty +kitten icat"

# ------------------------------------------------------------------------------
# Source work configuration files (may contain client secrets)
# (N) removes `zsh: no matches found` warning
for cfgFile in ~/.zshrc.*(N) ; do
  source "$cfgFile"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=(~/.completions $fpath)

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

if [[ $1 == eval ]]
then
    "$@"
set --
fi

export GPG_TTY=$(tty)
