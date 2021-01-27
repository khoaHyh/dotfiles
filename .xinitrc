#!/bin/sh

# Set resolution
sleep 2
$HOME/.screenlayout/myLayout.sh

# Set keybindings
xbindkeys

# Set wallpaper
hsetroot -cover $HOME/Pictures/tv-wallpaper.jpg

# Picom
# picom &

# spawn window manager
exec i3
