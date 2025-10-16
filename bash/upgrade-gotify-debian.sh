#!/bin/bash

# Requirements:
# - Unattended Upgrades package for the automated updates and upgrades
# - Gotify-CLI to send notifications
#
# The script looks through the unattended-upgrades.log for recently upgraded packages.
# If none is found, no message is sent.

unattended-upgrade -d

today=$(date "+%Y-%m-%d-%H")
message=$(cat /var/log/unattended-upgrades/unattended-upgrades.log | grep $today | grep " Packages that ")
if [ -z "$message" ]; then
    exit 0
fi

# Wrap the message in a codeblock for better markdown formatting
message='```\n'"${message}"'\n```'
title="Upgrade (<guest-name>)"
priority=2

gotify-cli push -p "$priority" -t "$title" --contentType "text/markdown" "$message"
