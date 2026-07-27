FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget curl
RUN apt-get install -y \
  php8.2-curl \
  php8.2-fpm \
  php8.2-gd \
  php8.2-intl \
  php8.2-mysql \
  php8.2-mbstring \
  php8.2-soap \
  php8.2-xml \
  php8.2-zip

RUN apt update -y
RUN apt install default-mysql-client -y

# here for debugging
RUN apt-get install telnet -y
RUN apt install net-tools

RUN wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# something something SECRETS!!!
ENV DOMAIN_NAME=${DOMAIN_NAME}
ENV WP_NAME=${WP_NAME}
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_USER_PASSWORD=${DB_USER_PASSWORD}
ENV WP_ADMIN=${WP_ADMIN}
ENV WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
ENV WP_ADMIN_EMAIL=${WP_ADMIN_EMAIL}
ENV WP_USER=${WP_USER}
ENV WP_USER_PASSWORD=${WP_USER_PASSWORD}
ENV WP_USER_EMAIL=${WP_USER_EMAIL}

# Create WordPress directory
WORKDIR /var/www/html

# Copy startup script
COPY tools/www.conf /etc/php/8.2/fpm/pool.d/
COPY tools/startup.sh /

# whee permissions
RUN chmod +x /startup.sh

EXPOSE 9000

# run script
ENTRYPOINT ["/startup.sh"]
