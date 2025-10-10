#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias cdwm='nano ~/dwm-btw/config.h'
alias mdwm='cd ~/dwm-btw; sudo make clean install; cd -'
export PATH="$HOME/.local/bin:$PATH"

# Set cursor theme
export XCURSOR_THEME="Bibata-Modern-Classic"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/charan/.lmstudio/bin"
# End of LM Studio CLI section

