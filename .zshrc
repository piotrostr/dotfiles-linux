# oh-my-zsh stuff
export ZSH="$HOME/.oh-my-zsh"
export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_SYMBOL="$"
export TYPEWRITTEN_ARROW_SYMBOL="git:" # 
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:green"
export TYPEWRITTEN_COLORS="arrow:white;symbol:yellow;git_branch:red;arrow:yellow"

autoload -U compinit && compinit
fpath+=$HOME/.zsh/typewritten
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U promptinit; promptinit
prompt typewritten

plugins=(
  aws
  aliases
  colorize
  command-not-found
  docker
  git
  node
  npm
  sudo
  yarn
  # the crucial make-zsh-like-fish plugins
  zsh-interactive-cd
  zsh-history-substring-search
  zsh-autosuggestions
  zsh-completions
)

alias vi='nvim'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history 1|sed '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias sign='echo $PW | sudo -S ls > /dev/null'

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

# completion
# source <(kubectl completion zsh)
source <(gh completion -s zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $ZSH/oh-my-zsh.sh
