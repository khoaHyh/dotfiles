#!/bin/sh
xautolock -detectsleep -time 5 -locker "i3lock -n -i ~/Wallpapers/groot-i-am-root-qhd-1920x1080.png" -killtime 10 -killer "systemctl suspend" &
