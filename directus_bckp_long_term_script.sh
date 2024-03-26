#!/bin/bash

# Backup directory
BACKUP_DIR="/media/backup/nocodb_bckp/long_term_bckp"
LOG_FILE="/media/backup/nocodb_bckp/long_term_bckp/bckp.log"

# Local directory to backup
SOURCE_DIR="/docker/directus/postgres"

# Create a timestamp with the format YYYYMMDDHHMMSS
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Redirect all output to the log file
exec &>> "$LOG_FILE"

# Enable immediate exit on error
set -e

# Create backup folders if they don't exist
mkdir -p "$BACKUP_DIR/$TIMESTAMP"

# Create backups
tar -czf "$BACKUP_DIR/$TIMESTAMP/backup.tar.gz" -C "$SOURCE_DIR" .

# Keep only the latest 52 backups
if [ -n "$(ls -A "$BACKUP_DIR")" ]; then
    ls -dt "$BACKUP_DIR"/* | tail -n +53 | xargs rm -rf
fi