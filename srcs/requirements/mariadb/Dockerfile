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
COPY tools/startup.sh /

# Putting secret info here for testing purposes :>
# TODO: REMOVE THIS LATER TY
ENV DB_ROOT_PASSWORD=root
ENV DB_DATABASE_NAME=mariadb
ENV DB_USER=user
ENV DB_USER_PASSWORD=user

EXPOSE 3306

RUN chmod +x /startup.sh

# run script
ENTRYPOINT ["/startup.sh"]

