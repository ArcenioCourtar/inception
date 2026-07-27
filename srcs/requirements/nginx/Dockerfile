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
COPY tools/startup.sh /
COPY nginx.conf /etc/nginx/

# Give execute permission in case compied file doesn't have them
RUN chmod +x /startup.sh

EXPOSE 443

# run script
ENTRYPOINT ["/startup.sh"]
