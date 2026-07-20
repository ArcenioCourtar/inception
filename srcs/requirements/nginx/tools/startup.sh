#!/bin/bash
# exit if any of my commands return an error
set -e

# DO STUFF!
echo "HELLO"

nginx -v
nginx -t

# nginx -g "daemon off;"

cat /etc/nginx/nginx.conf

echo "GOODBYE"
