#!/bin/sh

# Set resolution
sleep 2
/home/ka9/.screenlayout/myLayout.sh

# Set keybindings
xbindkeys

# Set wallpaper
hsetroot -cover ~/Pictures/deku-wallpaper.jpg

# spawn window manager
exec i3
