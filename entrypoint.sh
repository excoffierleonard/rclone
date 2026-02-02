#!/bin/sh

# Validate required environment variables
: "${RCLONE_REMOTE:?Environment variable RCLONE_REMOTE is required}"
: "${RCLONE_CONFIG_GDRIVE_TOKEN:?Environment variable RCLONE_CONFIG_GDRIVE_TOKEN is required}"

# Export relevant environment variables to .env file
env | grep -E '^(RCLONE_)' | sed "s/=/='/" | sed "s/$/'/" > /app/.env
chmod 600 /app/.env
exec crond -f
