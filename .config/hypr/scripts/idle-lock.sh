#!/bin/bash

ACTIVE=$(hyprctl activewindow -j | jq -r .class)

# Apps considered "video/focus mode"
case "$ACTIVE" in
  *firefox*|*brave*|*chrome*|*mpv*|*vlc*|*youtube*|*spotify*)
    exit 0   # skip locking
    ;;
esac

hyprlock