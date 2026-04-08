# .bashrc
# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
    return
fi

# Source global definitions
if [ -f /etc/bashrc ];
then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.opt/bin:$HOME/bin:" ]];
then
    PATH="$HOME/.opt/bin:$PATH/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if \[ -d \~/.bashrc.d \]; then
    for rc in \~/.bashrc.d/\*; do
        if \[ -f "$rc" \]; then
            . "$rc"
        fi
    done fi
unset rc

export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='vim'
export CLICOLOR=1
