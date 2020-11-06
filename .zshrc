#!/bin/bash

# ZSH
export ZSH="/Users/sehyun/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Antigen Settings
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle denysdovhan/spaceship-prompt
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply

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
alias cslogin="ssh cs61c-auu@hive7.cs.berkeley.edu"
alias venus="java -jar tools/venus.jar . -dm"
alias sd="sudo shutdown -h +60"
alias cdr="cd repo"
alias cdd="cd ~/Documents"
alias cddd="cd ~/Desktop"
alias zshrc="vi ~/.zshrc"
alias ns="npm start"
alias caskupgrade="brew outdated --cask | xargs brew cask reinstall"

# Homebrew Settings
export PATH="/usr/local/bin:$PATH"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).