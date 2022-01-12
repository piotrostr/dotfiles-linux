set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
status is-interactive &&
  eval /Users/piotrostrowski/miniconda/bin/conda "shell.fish" "hook" $argv | source && 
  conda deactivate &&
  conda activate &&
# <<< conda initialize <<<

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g "git"
alias ga "git add"
alias gc "git commit"
alias gp "git push"
alias gs "git status"
alias gd "git diff"
alias gl "git log"
command -qv nvim && alias vim nvim
alias vi nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/go/bin $PATH
set -gx GOPATH ~/go
set -gx REACT_DEBUGGER "open -g 'rndebugger://set-debugger-loc?port=8081' ||" react-native start --reset-cache
set -gx SDKROOT /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/

# NodeJS
set -gx PATH node_modules/.bin $PATH

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

