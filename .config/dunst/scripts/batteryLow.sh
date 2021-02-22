#!/bin/sh

capacity=""
capacity0=$(cat /sys/class/power_supply/BAT0/capacity) || exit
capacity1=$(cat /sys/class/power_supply/BAT1/capacity) || exit
rawIcon="/home/$USER/.config/dunst/scripts/icons/32x32_low-battery.png" || exit

if [ "$capacity1" -le 25 ]; then
    capacity="BAT0=$capacity0"
elif [ "$capacity1" -le 25 ]; then
    capacity="BAT1=$capacity1"
fi

dunstify -I "$rawIcon" -u normal "$capacity"
