#!/bin/bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerline
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Antigen Settings
source /Users/sehyun/antigen.zsh
antigen use oh-my-zsh
# antigen bundle denysdovhan/spaceship-prompt
# antigen bundle sindresorhus/pure
# antigen bundle mafredri/zsh-async
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# ZSH
export ZSH="/Users/sehyun/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# History size
HISTSIZE=5000
HISTFILESIZE=10000
SAVEHIST=5000
setopt EXTENDED_HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_DUPS

# execute "ls" after every time the "cd" command is finished. 
function cd {                                                   
  builtin cd "$@" && ls
}

# Aliases
alias git="hub"
alias cslogin="ssh cs61c-auu@hive8.cs.berkeley.edu"
alias venus="java -jar tools/venus.jar . -dm"
alias sd="sudo shutdown -h +60"
alias cdd="cd ~/Desktop"
alias cdc="cd ~/code"
alias zshrc="vi ~/.zshrc"
alias ns="npm start"
alias ys="yarn start"
alias cup="brew upgrade --cask --greedy"
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias gst="git status -sb"
alias flush-npm="rm -rf node_modules && npm cache verify && npm i"
alias ibrew="arch -x86_64 /usr/local/bin/brew"

# Homebrew Settings
export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

export PATH=$(pyenv root)/shims:$PATH

export PATH="$HOME/.poetry/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
