#
# ~/.bashrc
#

# set colors for directories when using ls
alias ls='ls --color=auto'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# starship bash config
eval "$(starship init bash)"

### RANDOM COLOR SCRIPT ###
colorscript random
source "$HOME/.cargo/env"
