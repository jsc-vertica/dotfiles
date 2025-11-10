#!/bin/bash

case $1 in
    "full")
        grim ~/Pictures/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png
        notify-send "Screenshot" "Full screen captured"
        ;;
    "full-clipboard")
        grim - | wl-copy
        notify-send "Screenshot" "Full screen copied to clipboard"
        ;;
    "area")
        grim -g "$(slurp)" ~/Pictures/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png
        notify-send "Screenshot" "Area captured"
        ;;
    "area-clipboard")
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot" "Area copied to clipboard"
        ;;
    "area-edit")
        grim -g "$(slurp)" - | swappy -f - -o - | wl-copy
        ;;
    "full-edit")
        grim - | swappy -f -
        ;;
    "window")
        # Get focused window geometry
        WINDOW=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
        grim -g "$WINDOW" ~/Pictures/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png
        notify-send "Screenshot" "Window captured"
        ;;
esac
