#!/bin/sh

# Prevent concurrent executions
LOCKFILE="/app/rclone.lock"
exec 9>"$LOCKFILE"
if ! flock -n 9; then
  echo "=== Mirroring skipped (already running): $(date) ==="
  exit 0
fi

# Exit on error and unset variables
set -eu

# Load environment variables
set -a
. /app/.env
set +a

# Perform mirroring
echo "=== Mirroring started: $(date) ==="
rclone sync /app/mirror $RCLONE_REMOTE -v
echo "=== Mirroring finished: $(date) ==="