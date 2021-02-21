#!/bin/sh

capacity0=$(cat /sys/class/power_supply/"BAT0"/capacity) || exit
capacity1=$(cat /sys/class/power_supply/"BAT1"/capacity) || exit

if [ "$capacity1" -le 25 || "$capacity0" -le 25 ]; then
    notify-send --urgency=normal "" "Battery low!"
fi

