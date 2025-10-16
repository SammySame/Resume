#!/bin/bash

# Requirements: 
# - Proxmox Backup Client to backup node files
# - Gotify-CLI to send notifications
#
# The files that will be backed up:
# - /etc/pve/
# - /etc/network/
# - /etc/resolv.conf
# - /etc/hostname
# - /etc/hosts
# To specify which directories to include or exclude, use the .pxarexclude files.
# https://pbs.proxmox.com/docs/backup-client.html#excluding-files-directories-from-a-backup

# The .env file should include exported PBS repository and password.
# If encrypting, PBS encryption key should also be included.
source /opt/scripts/.pbs-cred.env

# Replace <your-namespace> if using one or simply remove the line
message=$(proxmox-backup-client backup \
    root.pxar:/etc \
    --include-dev /etc/pve \
    --backup-type host \
    --ns <your-namespace> \
    --crypt-mode encrypt \
    --keyfile "$PBS_ENCRYPTION_KEY_FILE" \
    2>&1)

# Wrap the message in a codeblock for better markdown formatting
message='```\n'"${message}"'\n```'
title="Backup (<node-name>)"
priority=3
if [[ "$message" == *"WARNING"* || "$message" == *"error"* ]]; then
    priority=10
fi

gotify-cli push  -p "$priority" -t "$title" --contentType "text/markdown" "$message"
