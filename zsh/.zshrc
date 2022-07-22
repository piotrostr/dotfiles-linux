# oh-my-zsh stuff
export ZSH="$HOME/.oh-my-zsh"
autoload -U compinit && compinit

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
  deno

  # the crucial make-zsh-like-fish plugins
  zsh-interactive-cd
  zsh-history-substring-search
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':omz:update' mode auto   
zstyle ':omz:update' frequency 13

export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_SYMBOL="$"
export TYPEWRITTEN_ARROW_SYMBOL="git:" # 
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:green"
export TYPEWRITTEN_COLORS="arrow:white;symbol:yellow;git_branch:red;arrow:yellow"
export TYPEWRITTEN_DISABLE_RETURN_CODE=true

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:$PATH"

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
alias linode=linode-cli

autoload -Uz compinit && compinit

# dynamic theme
colorscheme=$(cat $HOME/.config/alacritty/alacritty.yml | grep COLORSCHEME)
if [[ $colorscheme == *"light"* ]]; then
  export DAYTIME="day"
else
  export DAYTIME="night"
fi

LIGHT_COLOR='gruvbox_light.yaml'
DARK_COLOR='gruvbox_dark.yaml'
# LIGHT_COLOR='atom_one_light.yaml'
# DARK_COLOR='one_dark.yaml'
# LIGHT_COLOR='github_light.yaml'
# DARK_COLOR='github_dark.yaml'
alias day="alacritty-colorscheme apply $LIGHT_COLOR && export DAYTIME=day"
alias night="alacritty-colorscheme apply $DARK_COLOR && export DAYTIME=night"

# Set typewritten ZSH as a prompt
autoload -U promptinit; promptinit
prompt typewritten
if [[ $OSTYPE == 'darwin'* ]];
then
  # source ~/base-env/bin/activate
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

  export PGDATABASE=postgres

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/opt/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/opt/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  conda deactivate
  conda activate
  # <<< conda initialize <<<

  # nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

  # env vars
  export GOPATH="$HOME"
  export PATH="$HOME/go/bin:$PATH"
  export MANPATH="/usr/local/man:$MANPATH"
  export LANG=en_US.UTF-8
  export REACT_DEBUGGER="open -g 'rndebugger://set-debugger-loc?port=8081' || react-native start --reset-cache"
  export PATH="/usr/local/opt/python@3.7/bin:$PATH"
  export EDITOR="nvim"
  export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/"
  export ARCHFLAGS="-arch arm64"
  export CGO_ENABLED=0
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

source ~/.nvm/nvm.sh

# source <(kubectl completion zsh)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
