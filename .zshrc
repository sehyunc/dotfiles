#!/bin/bash

# N - Node Version Manager Settings
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# Antigen Settings
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle denysdovhan/spaceship-prompt
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
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
alias zshrc="vi ~/.zshrc"
alias ns="npm start"
alias caskupgrade="brew outdated --cask | xargs brew cask reinstall"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'a
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias gst="git status -sb"
alias flush-npm="rm -rf node_modules && npm cache verify && npm i"

# Homebrew Settings
export PATH="/usr/local/bin:$PATH"

# Starship Prompt
# eval "$(starship init zsh)"

# Pyenv
eval "$(pyenv init -)"
