#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

DEFAULT_SESSION='qtile --shmlog-size 0'

xrdb -merge ~/.Xresources &

# Set background image
hsetroot -cover ~/Wallpapers/mobpsycho-wp2.jpg &

exec qtile
