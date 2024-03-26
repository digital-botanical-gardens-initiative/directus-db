#!/bin/bash

# Backup directory
BACKUP_DIR_LOCAL="/media/backup/directus_bckp/short_term_bckp"
BACKUP_DIR_DISTANT="/media/share/dbgi/directus_bckp/short_term_bckp"
LOG_FILE_LOCAL="/media/backup/directus_bckp/short_term_bckp/bckp.log"
LOG_FILE_DISTANT="/media/share/dbgi/directus_bckp/short_term_bckp/bckp.log"

# Local directory to backup
SOURCE_DIR="/docker/directus/postgres"

# Create a timestamp with the format YYYYMMDDHHMMSS
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Redirect all output to the log file
exec &>> "$LOG_FILE_LOCAL && $LOG_FILE_DISTANT"

# Enable immediate exit on error
set -e

# Create backups
tar -czf "$BACKUP_DIR_LOCAL/$TIMESTAMP.tar.gz" -C "$SOURCE_DIR" .
tar -czf "$BACKUP_DIR_DISTANT/$TIMESTAMP.tar.gz" -C "$SOURCE_DIR" .

# Keep only the latest 24 backups
if [ -n "$(ls -A "$BACKUP_DIR_LOCAL")" ]; then
    ls -dt "$BACKUP_DIR_LOCAL"/* | tail -n +26 | xargs rm -rf
fi

if [ -n "$(ls -A "$BACKUP_DIR_DISTANT")" ]; then
    ls -dt "$BACKUP_DIR_DISTANT"/* | tail -n +26 | xargs rm -rf
fi
