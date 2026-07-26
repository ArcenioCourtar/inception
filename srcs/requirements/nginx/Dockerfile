# Testing
FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx openssl -y

# create directory for SSL
RUN mkdir -p /etc/nginx/ssl

# Copy startup script
COPY tools/startup.sh /
COPY nginx.conf /etc/nginx/


RUN chmod +x /etc/nginx/nginx.conf
RUN envsubst < nginx.conf > nginx.conf

# Give execute permission in case compied file doesn't have them
RUN chmod +x /startup.sh

EXPOSE 443

# run script
CMD ["/startup.sh"]
