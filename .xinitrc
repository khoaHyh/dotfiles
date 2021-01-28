#!/bin/sh

# Set resolution
sleep 2
$HOME/.screenlayout/myLayout.sh

# Set keybindings
xbindkeys

# Set wallpaper
hsetroot -cover $HOME/Pictures/scalable-dark-linux.png

# Picom
# picom &

# spawn window manager
exec i3
