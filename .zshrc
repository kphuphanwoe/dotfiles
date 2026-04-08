# If not running interactively, don't do anything
[ -z "$PS1" ] && return

autoload -Uz vcs_info

# This needs prompt_subst set, hence the name. So:
setopt PROMPT_SUBST

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Default key bindings
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^u' kill-whole-line
bindkey '^k' kill-line
bindkey '^m' accept-line
bindkey '^l' clear-screen
bindkey '^i' expand-or-complete
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^p' up-line-or-history
bindkey '^n' down-line-or-history
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '^y' yank
bindkey '^_' undo
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

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
