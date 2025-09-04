# Path to your oh-my-zsh installation.
export HOME=~
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim
ZSH_THEME="agnoster"
SSH_ENV="$HOME/.ssh/environment"

plugins=(git)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User configuration
export PATH=$HOME/.opt/bin:$PATH

export MPI_DIR=$HOME/.opt/mpi
export LD_LIBRARY_PATH=$MPI_DIR/lib:$HOME/.opt/mpi/lib:$LD_LIBRARY_PATH
export PATH=$MPI_DIR/bin:$HOME/.opt/mpi/bin:$PATH

export OFI_DIR=$HOME/.opt/ofi
export LD_LIBRARY_PATH=$OFI_DIR/lib:$HOME/.opt/ofi/lib:$LD_LIBRARY_PATH
export PATH=$OFI_DIR/bin:$HOME/.opt/ofi/bin:$PATH

alias vi="vim"
alias cls="clear"
alias py="python3"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -al --color=auto"
alias reload="source $HOME/.zshrc"

function start_agent
{
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed "s/^echo/#echo/" > "${SSH_ENV}"
    echo "Succeeded"
    chmod 600 "${SSH_ENV}"
    source "${SSH_ENV}" > /dev/null

    if [ -f $HOME/.ssh/agent ]; then
        /usr/bin/ssh-add $HOME/.ssh/agent
    else
        echo "Warning: SSH key ${HOME}/.ssh/agent not found."
    fi
}

# Search and open files in Vim
# Replace script vim-explore
function vf
{
    local file
    file=(${(f)"$(find . \( -path './.git' -o -path './.cache' \)              \
        -prune -o -iname "*$1*" -print0 |
        fzf --read0 -0 -1 -m)"})
    [[ -n $file ]] && vim -- $file
}

# Fuzzy find a directories and cd into it
function fd
{
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

# Print folder structure in a tree-like format
function t {
    [ -d "$1" ] && { dir="$1"; shift; } || dir='.'
    find "$dir" "$@" | sed -e 's@/@|@g;s/^\.|//;s/[^|][^|]*|/ |/g;/^[. |]*$/d'
}
