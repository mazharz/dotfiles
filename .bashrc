# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# files to load
_CONFIGS=(
  "$HOME/.config/bash/colors" # make sure you load colors first, other files use it
  "$HOME/.config/bash/less"
  "$HOME/.config/bash/prompt"
  "$HOME/.config/bash/aliases"
  "$HOME/.config/bash/vars"
  "$HOME/.config/bash/functions" # make sure to place after vars, (b() uses one)
)

for _CONFIG in "${_CONFIGS[@]}"; do
  [[ -f "$_CONFIG" ]] && . "$_CONFIG"
done

# sources
. "$HOME/.cargo/env"

