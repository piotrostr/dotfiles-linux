# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias python=python3.9
export EDITOR='nvim'
alias ls="ls -G"

export NVM_DIR="$HOME/.nvm"

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

alias ibrew="arch -x86_64 /usr/local/bin/brew"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias tmux="TERM=screen-256color-bce tmux"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


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
# <<< conda initialize <<<

conda deactivate
conda activate

alias vi=nvim
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

