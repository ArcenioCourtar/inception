FROM debian:bookworm

# install nginx and openssl
RUN apt-get update -y
RUN apt-get install -y mariadb-server

# Create directories needed for db
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

# Copy startup script
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/startup_db.sh /

EXPOSE 3306

RUN chmod +x /startup_db.sh

# run script
ENTRYPOINT ["/startup_db.sh"]

