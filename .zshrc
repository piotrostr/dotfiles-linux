# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh stuff
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':omz:update' mode auto   
zstyle ':omz:update' frequency 13

plugins=(
  aws
  aliases 
  brew 
  colorize 
  command-not-found 
  copyfile 
  docker 
  gatsby 
  git
  git-lfs 
  git-prompt 
  node 
  npm 
  sudo 
  xcode 
  yarn 
  colored-man-pages

  # the crucial make-zsh-like-fish plugins
  zsh-interactive-cd
  zsh-history-substring-search
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration
# conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/piotrostrowski/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/piotrostrowski/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/piotrostrowski/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/piotrostrowski/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup

# nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# env vars
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PYTHONPATH="$HOME/miniconda/bin/python:$PYTHONPATH"
export GOPATH="$HOME/go"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export REACT_DEBUGGER="open -g 'rndebugger://set-debugger-loc?port=8081' || react-native start --reset-cache"
export NVM_DIR="$HOME/.nvm"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"
export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/"
export ARCHFLAGS="-arch arm64"
export NODE_OPTIONS=--openssl-legacy-provider

# aliases
alias ls="ls -G"
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias vi=nvim
alias gs="git status"
alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
alias zc="vi ~/.zshrc"
alias zp="vi ~/.zprofile"
alias vc="vi ~/.config/nvim/init.vim"
alias vp="vi ~/.config/nvim/plug.vim"
alias acf="vi ~/.config/alacritty/alacritty.yml"
alias hardhat="npx hardhat"
alias python="~/miniconda/bin/python"
alias pip="~/miniconda/bin/pip"
alias linode=linode-cli

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
