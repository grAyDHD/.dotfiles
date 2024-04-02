#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.

# Ensure the script is running interactively before proceeding
case ${-} in
    *i*) ;;
      *) return;;
esac

# Load color support for ls and define aliases
if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Keyboard configuration aliases
alias cs='setxkbmap -option ctrl:swapcaps' # Swap caps
alias cr='setxkbmap -option'               # Revert swap

# tmux aliases
alias tls='tmux ls'
alias tlsw='tmux lsw'
alias tma='tmux attach'

# Safeguard aliases to avoid accidental deletions, overwrites, and moves
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#directory aliases
alias ngGo='cd ~/Code/Angular'
alias ngEdu='cd ~/Code/Angular/Education'
alias cd.='cd ../'
alias cdw='cd ~/Code/Web'
# Color codes
BLUE="\[\e[38;5;123m\]"
LAVENDER="\[\e[38;5;219m\]"
NO_COLOR="\[\e[0m\]"

# PS1 customization
if [[ -n ${TMUX} ]]; then
    PS1="${BLUE}\\u${NO_COLOR}@${LAVENDER}\\h${NO_COLOR}:${NO_COLOR}\\w${NO_COLOR}\$\\n"
else
    PS1="${BLUE}\\u${NO_COLOR}@${LAVENDER}\\h${NO_COLOR}:${NO_COLOR}\\w${NO_COLOR}\$ "
fi

# Display neofetch if not in tmux and command exists
if [[ -n ${PS1} ]] && [[ -z ${TMUX} ]]; then
	command -v neofetch &> /dev/null && neofetch
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
