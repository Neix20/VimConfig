cd ~
clear

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

ZSH_THEME="duellj"

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Interactive operation...

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='lsd'
alias dir='lsd'

alias home='cd ~'
alias cls="clear"

# Custom Location
alias nvimHome='cd $APPDATA/../Local/nvim'

export USERNAME="Neix19365"
export NICKNAME="Neix"

# Welcome message
echo -ne "Good Morning, $NICKNAME! It's "; date '+%A, %B %-d %Y'

source /home/txen2/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
