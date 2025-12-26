#!/usr/bin/env bash

# using `cut -c 1-50` causes error on umlaut breakage (split in two)
# hence using the `awk print substr`
song=$(mpc current)
song_truncated=$(echo -n "$song" |  awk '{print substr($0, 1, 40)}')
status=$(mpc status %state%)
icon=$([ "$status" = "playing" ] && echo -n " " || echo -n " ")

progress_percent=$(mpc status "%percenttime%" | awk '{print $1}' | tr % ' ')
progress_percent="${progress_percent:=0}" # fallback value

length=${#song}
split_index=$((length * progress_percent / 100 ))

escape_amp() {
    echo "${1//&/\&amp;}"
}

elipsis=$([ "$length" -gt 40 ] && echo -n "..." || echo -n "")

escaped_text=$(escape_amp "${icon}${song_truncated}${elipsis}")

elapsed_part=$(escape_amp "${escaped_text:0:split_index}")
remaining_part=$(escape_amp "${escaped_text:split_index}")

echo -n "<b>${elapsed_part}</b>${remaining_part}"

