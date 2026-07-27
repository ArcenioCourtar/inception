#!/bin/bash
set -e

mkdir -p /var/www/html/wordpress
touch /run/php/php8.2-fpm.pid;
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;

# Download/Install WordPress if not already present
if [ ! -f wp-config.php ]; then

    	# Install WP-CLI (wp command)
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
    
    	cd /var/www/html/wordpress
    
    	# Downloading WordPress"
   	wp core download \
        	--path="/var/www/html/wordpress/" \
        	--allow-root
    	echo "WordPress downloaded."

		# Note the lack of space betweew -p and the pw, option won't work otherwise :)
		echo "Pinging MariaDB to check if it's alive"
    	until mysqladmin -h ${DB_NAME} -u ${DB_USER} -p${DB_USER_PASSWORD} ping; do
        	sleep 2
    	done
else
	echo "WordPress is already downloaded"
fi

echo "Starting PHP-FPM"
exec /usr/sbin/php-fpm8.2 -F
