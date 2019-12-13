#
# ~/.bashrc
#

[[ $- != *i* ]] && return

export OPENER=rifle
export EDITOR=nvim
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# unlimited bash history
export HISTSIZE=10000
export HISTFILESIZE=10000
# avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# custom alias
alias la='ls --group-directories-first -a --color=auto'
alias ls='ls --group-directories-first --color=auto'
alias ll='ls --group-directories-first -al --color=auto'
alias grep='grep --color=auto'
alias shutdown='shutdown now'
alias suspend='systemctl suspend'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim='nvim'
alias pac='sudo pacman'
alias r='ranger'
alias mkd='mkdir -pv'
alias cp='cp -i'
alias df='df -h'

# fzf with fd for super fast fuzzy searching
export FZF_DEFAULT_COMMAND='fd --hidden --type f --exclude={.git,.cache}'
# export FZF_DEFAULT_OPTS='--ansi'
export FZF_CTRL_T_COMMAND='fd --hidden --type f --exclude ".git"'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# show git branch on bash-prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (git:\1)/'
}

# PS1
BLUE="\[\033[01;38;5;66m\]"
LIGHT_BLUE="\[\033[01;38;5;109m\]"
YELLOW="\[\033[01;38;5;172m\]"

PS1=""
PS1+="${BLUE}[\u@\h] ${LIGHT_BLUE}\w${YELLOW}\$(parse_git_branch)\\n\[$(tput sgr0)\] 𝝺 "
