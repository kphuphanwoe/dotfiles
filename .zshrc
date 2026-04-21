# If not running interactively, don't do anything
[ -z "$PS1" ] && return

autoload -Uz vcs_info

# This needs prompt_subst set, hence the name. So:
setopt PROMPT_SUBST

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Use Emacs-mode default key bindings
bindkey -e

# Disable Beep on error
setopt NO_BEEP

zstyle ":vcs_info:git*" formats "%b"
function precmd() {
    # As always first run the system so everything is setup correctly.
    vcs_info

    if [[ -z ${vcs_info_msg_0_} ]];
    then
        # Oh hey, nothing from vcs_info, so we got more space.
        # Let's print a longer part of $PWD...
        PS1="%n@%m:%F{cyan}%~%f $ "
    else
        # vcs_info found something, that needs space. So a shorter $PWD
        # makes sense.
        PS1="%n@%m:%F{cyan}%3~%f%F{130}:${vcs_info_msg_0_}%f $ "
    fi
}

export EDITOR="vim"
export CLICOLOR=1
export PATH=$HOME/.opt/mpi/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.opt/mpi/bin:$LD_LIBRARY_PATH

# enable color support of ls and also add handy aliases
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
