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

#Internship aliases
alias cdng='cd ~/Code/Web/Angular'
alias cdinf='cd ~/Code/Web/Angular/Internship/frontend'
alias cdinfp='cd ~/Code/Web/Angular/Internship/frontend/web/projects'
alias cdgth='cd ~/Code/Web/Angular/Internship/frontend/web/projects/gth'
alias cdgthl='cd ~/Code/Web/Angular/Internship/frontend/web/projects/gth-legacy'

#directory aliases
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cdw='cd ~/Code/Web'

#conf aliases
alias cdcn='cd ~/.config/nvim'
alias cdca='cd ~/.config/alacritty'

#angular aliases
alias ngc='ng generate component'

#source alias
alias src='source .bashrc'

# Color codes
BLUE="\[\e[38;5;123m\]"
LAVENDER="\[\e[38;5;219m\]"
NO_COLOR="\[\e[0m\]"
DARK_BLUE="\[\e[38;5;6m\]"
ORANGE="\[\e[38;5;202m\]"

# PS1 customization
if [[ -n ${TMUX} ]]; then
    PS1="${DARK_BLUE}\\u${NO_COLOR}@${ORANGE}\\h${NO_COLOR}:${NO_COLOR}\\w${NO_COLOR}\$\\n"
else
    PS1="${DARK_BLUE}\\u${NO_COLOR}@${ORANGE}\\h${NO_COLOR}:${NO_COLOR}\\w${NO_COLOR}\$ "
fi

# Display neofetch if not in tmux and command exists
if [[ -n ${PS1} ]] && [[ -z ${TMUX} ]]; then
	command -v neofetch &> /dev/null && neofetch
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
