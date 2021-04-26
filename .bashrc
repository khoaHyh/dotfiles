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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
