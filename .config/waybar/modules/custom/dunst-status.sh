#!/usr/bin/env bash

status=$(dunstctl is-paused)

if [ "$status" == "true" ]; then
  echo '{"text":"⦻","class":"disallowed"}' | jq --unbuffered --compact-output
else
  echo '{"text":"⦽","class":"allowed"}' | jq --unbuffered --compact-output
fi
