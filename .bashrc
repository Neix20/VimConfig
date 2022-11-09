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
alias nvimHome='cd $APPDATA/../Local/nvim'

# Export Path
export PATH=$PATH:"/C/Program Files/Neovim/bin"
export PATH=$PATH:"/C/Users/txen2/AppData/Local/Programs/Microsoft VS Code/bin"

# Export Language
export PATH=$PATH:"/C/Users/txen2/AppData/Local/Programs/Python/Python39"
export PATH=$PATH:"/C/Users/txen2/AppData/Local/Programs/Python/Python39/Scripts"
export PATH=$PATH:"/C/Program Files (x86)/NodeJS"

export USERNAME="Neix19365"
export NICKNAME="Neix"

# Welcome message
echo -ne "Good Morning, $NICKNAME! It's "; date '+%A, %B %-d %Y'
