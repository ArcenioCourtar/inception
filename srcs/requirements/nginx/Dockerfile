# Testing
FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx openssl -y

# Copy startup script
COPY tools/startup.sh /
COPY nginx.conf /etc/nginx/

# Give execute permission in case compied file doesn't have them
RUN chmod +x /startup.sh

# run script
CMD ["/startup.sh"]
