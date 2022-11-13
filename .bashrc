# My Own Custom
cd ~
clear

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Interactive operation...

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls'
alias dir='ls'

alias home='cd ~'
alias cls="clear"

# Custom Location
alias nvimHome='cd ~/.config/nvim'
alias wslHome='cd /mnt/c/Users/txen2'
alias c='cd /mnt/c'
alias d='cd /mnt/d'

export USERNAME="Neix19365"
export NICKNAME="Neix"

# Enable Snap Store (For WSL)
exec sudo nsenter -t $(pidof systemd) -a su - $LOGNAME

# Welcome message
echo -ne "Good Morning, $NICKNAME! It's "; date '+%A, %B %-d %Y'

