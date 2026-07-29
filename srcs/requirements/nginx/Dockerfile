# Testing
FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get install -y nginx openssl
RUN apt update
# installed for envsubst, needed for proper domain name in nginx.conf
RUN apt install gettext-base

# create directory for SSL
RUN mkdir -p /etc/nginx/ssl

# Copy startup script and nginx config
COPY tools/startup_ngx.sh /
COPY tools/nginx.conf /
# Give execute permission in case copied file doesn't have them
RUN chmod +x /startup_ngx.sh

EXPOSE 443

# run script
ENTRYPOINT ["/startup_ngx.sh"]
#- STUFF USED FOR LEARNING/DEBUGGING PREVIOUSLY
#- not installing anymore to lower image size and build time
# installing nc to test port connectivity within network
# RUN apt install netcat-openbsd
