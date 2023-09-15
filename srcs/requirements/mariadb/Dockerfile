# Use the official Debian base image
FROM debian:11

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get install -yq mariadb-server && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./conf/start.sh .
RUN chmod 744 ./start.sh
ENTRYPOINT ./start.sh

# ENTRYPOINT [ "tail", "-f", "/dev/null" ]
# CMD [ "mysqld", "--bind-address=0.0.0.0" ]