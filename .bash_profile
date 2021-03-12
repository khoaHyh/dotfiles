#
# ~/.bash_profile
#

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

source "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

# Use system anti-aliased fonts and make swing use the GTK look and feel
export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
