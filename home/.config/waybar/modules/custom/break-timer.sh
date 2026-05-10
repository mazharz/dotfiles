#!/usr/bin/env bash

if systemctl --user is-active --quiet break-timer; then
  echo '{"text": "", "class": "active"}' | jq --unbuffered --compact-output
else
  echo '{"text": "", "class": "inactive"}' | jq --unbuffered --compact-output
fi
