#!/bin/sh
set -e

# Fix permissions for the mounted volume (if it exists)
if [ -d /app/data ]; then
    chown -R appuser:appgroup /app/data || true
    chmod -R 755 /app/data || true
fi

# Run the application as appuser
exec su-exec appuser "$@"