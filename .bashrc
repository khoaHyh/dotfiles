#
# ~/.bashrc
#

# set colors for directories when using ls
alias ls='ls --color=auto'

# fix discord becoming unresponsive during long calls
alias discord='discord --no-sandbox'

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

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Add directory to the $PATH variable
echo "PATH=$PATH:~/.config/rofi/bin" >> ~/.profile
