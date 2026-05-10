#!/usr/bin/env bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -f 2 -d ' ' | sed 's/\.\|^0//g')

echo -n " ${volume}%"
