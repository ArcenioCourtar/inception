# Testing
FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx openssl -y

# Copy startup script
COPY tools/startup.sh /

# run script
CMD ["/startup.sh"]
