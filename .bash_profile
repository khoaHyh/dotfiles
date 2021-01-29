#
# ~/.bash_profile
#

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# startx with xinit configurations
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx ~/.xinitrc --vt1
