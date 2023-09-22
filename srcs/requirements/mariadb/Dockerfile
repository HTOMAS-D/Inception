# # Use the official Debian base image
FROM debian:buster

# Install MariaDB and other required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -yq mariadb-server && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./conf/start.sh .
RUN chmod 744 ./start.sh

EXPOSE 3306

ENTRYPOINT ./start.sh

#ENTRYPOINT [ "tail", "-f", "/dev/null" ]