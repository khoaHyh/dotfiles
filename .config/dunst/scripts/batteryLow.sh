#!/bin/bash

# Prepend these env varibles to crontab
# DISPLAY=":0.0"
# XAUTHORITY="/home/me/.Xauthority"
# XDG_RUNTIME_DIR="/run/user/1000"
# DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

capacity=""
capacity0=$(cat /sys/class/power_supply/BAT0/capacity) || exit
capacity1=$(cat /sys/class/power_supply/BAT1/capacity) || exit
rawIcon="/home/$USER/.config/dunst/scripts/icons/32x32_low-battery.png" || exit

function dunst_notify {
    dunstify -I "$rawIcon" -u normal "$capacity"
}

# If either battery is less than or equal to 25%, dunstify
if [[ "$capacity1" -le 25 ]]; then
    capacity="BAT1=$capacity1"
    dunst_notify
elif [[ "$capacity0" -le 25 ]]; then
    capacity="BAT0=$capacity0"
    dunst_notify
fi

