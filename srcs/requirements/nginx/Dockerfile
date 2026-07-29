# Testing
FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get install -y nginx openssl
RUN apt update
# installed for envsubst
RUN apt install gettext-base
# installing nc to test ports
RUN apt install netcat-openbsd

# create directory for SSL
RUN mkdir -p /etc/nginx/ssl

# Copy startup script
COPY tools/startup_ngx.sh /
COPY tools/nginx.conf /etc/nginx/
RUN envsubst ${DOMAIN_NAME} < /etc/nginx/nginx.conf > output
# Give execute permission in case compied file doesn't have them
RUN chmod +x /startup_ngx.sh

EXPOSE 443

# run script
ENTRYPOINT ["/startup_ngx.sh"]
