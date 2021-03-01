#
# ~/.bash_profile
#

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

source "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"
