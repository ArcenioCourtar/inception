FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

# Copy startup script
COPY tools/startup.sh /

EXPOSE 3306

RUN chmod +x /startup.sh

# run script
CMD ["/startup.sh"]

