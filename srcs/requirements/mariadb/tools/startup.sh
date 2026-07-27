#!/bin/bash

echo "Initializing MariaDB"

# Initialize MySQL data directory if it doesn't exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

# Start the server (no networking for setup)
echo "Starting temp server for setup (no networking)"
mysqld --skip-networking --socket=/run/mysqld/mysqld.sock --user=mysql &
pid="$!"

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to be ready..."
until mysqladmin --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1; do
    sleep 1
done
echo "MariaDB is ready!"

# Run setup SQL: create database and users
echo "Running SQL setup"
mysql --socket=/run/mysqld/mysqld.sock -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${WP_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WP_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# Shut down temporary server
echo "Shutting down temp DB"
mysqladmin --socket=/run/mysqld/mysqld.sock -u root -p"${DB_ROOT_PASSWORD}" shutdown

# Wait for shutdown
wait "$pid" || true

# Start MariaDB normally (with networking)
echo "Restarting DB with networking"
exec mysqld --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock

