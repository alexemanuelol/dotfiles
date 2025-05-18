# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux
         command-not-found
         git
         wd
         zsh-autosuggestions
         zsh-syntax-highlighting)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-myzsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jnrowe"

source $ZSH/oh-my-zsh.sh

# History
HISTFILE=~/.zsh_history
HISTSIZE=20000
HISTSAVE=20000
HIST_STAMPS="yyyy-mm-dd"

export EDITOR="nvim"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# vi mode
bindkey -v

# Ctrl + space - Accept autosuggestion
bindkey '^ ' autosuggest-accept

# Aliases
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"

#source ~/.aliases
#source ~/.functions

