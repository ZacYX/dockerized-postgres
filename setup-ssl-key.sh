#!/bin/bash

# Debugging: check initial permissions
echo "Initial permissions for server.key:"
ls -l /var/lib/postgresql/ssl/server.key

echo "Initial permissions for server.crt:"
ls -l /var/lib/postgresql/ssl/server.crt

# Ensure correct ownership and permissions for the data directory
chown -R postgres:postgres /var/lib/postgresql/data
chmod 0700 /var/lib/postgresql/data


# Change ownership of SSL files
chown postgres:postgres /var/lib/postgresql/ssl/server.key
chown postgres:postgres /var/lib/postgresql/ssl/server.crt

# Ensure correct permissions
chmod 0600 /var/lib/postgresql/ssl/server.key
chmod 0644 /var/lib/postgresql/ssl/server.crt

# Debugging: check permissions after change
echo "Permissions for server.key after change:"
ls -l /var/lib/postgresql/ssl/server.key

echo "Permissions for server.crt after change:"
ls -l /var/lib/postgresql/ssl/server.crt


# Start PostgreSQL
exec docker-entrypoint.sh "$@"

