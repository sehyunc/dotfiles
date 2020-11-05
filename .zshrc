#!/bin/bash

# Add every binary that requires nvm, npm or node to run to an array of node globals
NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")
NODE_GLOBALS+=("npx")

# Lazy-loading nvm + npm on node globals call
load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  if [ -f "$NVM_DIR/bash_completion" ]; then
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  fi
}

# Making node global trigger the lazy loading
for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${cmd} >/dev/null 2>&1; load_nvm; ${cmd} \$@; }"
done

# Antigen Settings
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle denysdovhan/spaceship-prompt
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply

# Path to your oh-my-zsh installation.
export ZSH="/Users/sehyun/.oh-my-zsh"

# Themes
ZSH_THEME=""

# Plugins
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
alias cslogin="ssh cs61c-auu@hive7.cs.berkeley.edu"
alias venus="java -jar tools/venus.jar . -dm"
alias sd="sudo shutdown -h +60"
alias cdr="cd repo"
alias cdd="cd ~/Documents"
alias cddd="cd ~/Desktop"
alias zshrc="vi ~/.zshrc"
alias ns="npm start"
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
alias caskupgrade="brew outdated --cask | xargs brew cask reinstall"

# Homebrew Settings
export PATH="/usr/local/bin:$PATH"
#export PATH="${HOME}/bin:${PATH}"

# PyEnv Settings
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
