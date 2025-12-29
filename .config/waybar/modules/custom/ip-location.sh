#!/usr/bin/env bash

result=$(curl --max-time 10 http://ip-api.com/json)
code=$(echo "$result" | jq -r '.countryCode' | tr '[:upper:]' '[:lower:]')
name=$(echo "$result" | jq -r '.country')

echo "{\"text\": \"${code}\", \"tooltip\": \"${name}\"}" | jq --unbuffered --compact-output
