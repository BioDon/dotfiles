#!/bin/bash

# Get battery percentage
percentage=$(cat /sys/class/power_supply/BAT0/capacity)

# Get charging status
status=$(cat /sys/class/power_supply/BAT0/status)

# Determine number of filled blocks (out of 5)
if [ "$percentage" -ge 80 ]; then
    blocks="■■■■■"
elif [ "$percentage" -ge 60 ]; then
    blocks="■■■■▫"
elif [ "$percentage" -ge 40 ]; then
    blocks="■■■▫▫"
elif [ "$percentage" -ge 20 ]; then
    blocks="■■▫▫▫"
else
    blocks="■▫▫▫▫"
fi

# Display with status indicators
if [ "$status" = "Charging" ]; then
    echo "⚡ $blocks"
elif [ "$percentage" -eq 100 ]; then
    echo "FULL $blocks"
elif [ "$percentage" -le 10 ]; then
    echo "LOW! $blocks"
else
    echo "$blocks"
fi