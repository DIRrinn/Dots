#!/bin/sh

while true; do
    battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
    if [ "$battery" -le "20" ]; then
        notify-send "Low battery: ${battery}%" -i ~/.config/hypr/warning.png
	if [ $(swaync-client -D) = "false" ]; then
	mpv --no-terminal ~/.config/swaync/notification.wav
	fi
        sleep 240
    else
        sleep 120
    fi
done
