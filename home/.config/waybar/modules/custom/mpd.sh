#!/usr/bin/env bash

get_icon() {
    if [[ "$status" == "playing" ]]; then
        echo -n " "
    elif [[ "$status" == "paused" ]]; then
        echo -n " "
    elif [[ "$status" == "stopped" ]];then
        echo -n ""
    fi
}

song=$(mpc current)
# awk preserves umlauts when breaking up strings
song_truncated=$(echo -n "$song" |  awk '{print substr($0, 1, 40)}')
status=$(mpc status %state%)
icon=$(get_icon status)

progress_percent=$(mpc status "%percenttime%" | awk '{print $1}' | tr % ' ')
progress_percent="${progress_percent:=0}" # fallback value

length=${#song}

escape_amp() {
    echo "${1//&/\&amp;}"
}

elipsis=$([ "$length" -gt 40 ] && echo -n "..." || echo -n "")

escaped_text=$(escape_amp "${icon}${song_truncated}${elipsis}")

split_index=$(( ${#escaped_text} * progress_percent / 100 ))

elapsed_part=$(escape_amp "${escaped_text:0:split_index}")
remaining_part=$(escape_amp "${escaped_text:split_index}")

echo -n "<b>${elapsed_part}</b>${remaining_part}"

