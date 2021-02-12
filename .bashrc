#
# ~/.bashrc
#

# set colors for directories when using ls
alias ls='ls --color=auto'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

# function to parse current git branch
# parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
# }

# Fancy prompt
# export PS1=" ${fg[11]}────\u \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# starship bash config
eval "$(starship init bash)"
