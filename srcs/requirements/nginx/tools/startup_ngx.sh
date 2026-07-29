#!/bin/bash
# exit if any of my commands return an error
set -e

# Use localhost if domain name is not provided
: "${DOMAIN_NAME:=localhost}"

# substitute $DOMAIN_NAME with the domain set in .env
envsubst '${DOMAIN_NAME}' < nginx.conf > /etc/nginx/nginx.conf
rm nginx.conf

# generate SSL cert if we don't have on yet
if [ ! -f /etc/nginx/ssl/nginx.crt ]; then
	echo "Generating SSL certificate for ${DOMAIN_NAME}"

	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/nginx.key \
		-out /etc/nginx/ssl/nginx.crt \
		-subj "/C=NL/ST=Brabant/L=Eindhoven/O=Whatever/CN=${DOMAIN_NAME}"

	chmod 600 /etc/nginx/ssl/nginx.key
	chmod 644 /etc/nginx/ssl/nginx.crt

	echo "SSL cert generated at /etc/nginx/ssl"
else
	echo "SSL cert already exists. skpping gen"
fi

# Testing if nginx ocnfig is valid before running
nginx -t

# starting nginx
exec nginx -g "daemon off;"
