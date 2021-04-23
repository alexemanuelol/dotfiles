# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# History command output timestamp format.
HIST_STAMPS="yyyy-mm-dd"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


source $ZSH/oh-my-zsh.sh

# Theme inspired from 'simple'
SSH_HOSTNAME=$([[ -n "$SSH_CONNECTION" ]] && echo "$(hostname) ")
local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
PROMPT='$return_code$SSH_HOSTNAME%(!.%{$fg[red]%}.%{$fg[green]%})%~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} '
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
