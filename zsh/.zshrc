# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export BROWSER="firefox"
export EDITOR="nvim"
export pager="less"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# History command output timestamp format.
HIST_STAMPS="yyyy-mm-dd"

# Ctrl + space - Accept autosuggestion
bindkey '^ ' autosuggest-accept

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         zsh-autosuggestions
         zsh-syntax-highlighting)

ZSH_THEME="jnrowe"

source $ZSH/oh-my-zsh.sh

# Aliases
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"

source ~/.aliases
source ~/.functions

# History
HISTSIZE=10000
HISTSAVE=10000
