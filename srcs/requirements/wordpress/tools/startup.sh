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

    	echo "Creating WordPress Config"
	wp config create \
        	--path="/var/www/html/wordpress/" \
		--dbname="${WP_NAME}" \
		--dbuser="${DB_USER}" \
		--dbpass="${DB_USER_PASSWORD}" \
		--dbhost="${DB_NAME}" \
		--allow-root

    	# Create Wordpress Admin
	echo "Creating Wordpress Admin"
    	wp core install \
        	--path="/var/www/html/wordpress/" \
        	--url="${DOMAIN_NAME}" \
        	--title="inception" \
        	--admin_user="${WP_ADMIN}" \
        	--admin_password="${WP_ADMIN_PASSWORD}" \
        	--admin_email="${WP_ADMIN_EMAIL}" \
        	--allow-root

   	# Create Wordpress User
    	echo "Creating Wordpress User" 
	wp user create ${WP_USER} ${WP_USER_EMAIL} \
        	--path="/var/www/html/wordpress/" \
        	--user_pass="${WP_USER_PASSWORD}" \
			--role=editor
        	--allow-root

	echo "WordPress finished installing"
else
	echo "WordPress is already downloaded"
fi

echo "Starting PHP-FPM"
exec /usr/sbin/php-fpm8.2 -F
