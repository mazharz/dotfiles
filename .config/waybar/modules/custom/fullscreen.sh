#!/usr/bin/env bash

is_fullscreen=$(hyprctl activewindow -j | jq -r '.fullscreen')

if [[ "$is_fullscreen" -gt 0 ]]; then
    echo '󰍹'
else
    echo ''
fi
