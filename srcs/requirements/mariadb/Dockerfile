FROM debian:bookworm

EXPOSE 3306
# install nginx and openssl
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb

# Copy startup script
COPY tools/startup.sh /

# run script
CMD ["/startup.sh"]

