#!/bin/bash

# Requirements:
# - Unattended Upgrades package for the automated updates and upgrades
# - Gotify-CLI to send notifications
#
# The script looks through the unattended-upgrades.log for recently upgraded packages.
# If none is found, no message is sent.

unattended-upgrade -d

today=$(date "+%Y-%m-%d %H")
message=$(cat /var/log/unattended-upgrades/unattended-upgrades.log | grep "${today}" | grep " Packages that will")
if [ -z "$message" ]; then
    exit 0
fi

message=$(echo $message | sed 's/.*upgraded://') # Only include package names in the description
message=$(echo $message | tr ' ' ', ') # Format packages as a comma separated list
title="Upgrade (<guest-name>)"
priority=5

gotify-cli push -p "$priority" -t "$title" --contentType "text/plain" "$message"
