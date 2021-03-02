#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT1/capacity) || exit

if [[ "$capacity" -gt 25 ]]; then
    echo "Over 25"
else
    echo "Under 25"
fi
