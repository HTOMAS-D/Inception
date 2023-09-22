# # Use the official Debian base image
# FROM debian:buster

# # Install MariaDB and other required packages
# RUN apt-get update && \
#     apt-get install -yq mariadb-server && \ 
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# # RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
# RUN mkdir -p /var/run/mysqld && \
#     chown -R mysql:mysql /var/run/mysqld && \
#     chmod 777 /var/run/mysqld
FROM debian:buster-slim

# Update the package database and install necessary packages
# like MariaDB server and client, and Curl (a tool to transfer data from or to a server)
RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    curl && \
    # Remove the package list to reduce the size of the image
    rm -rf /var/lib/apt/lists/*

# Create a directory for the MariaDB UNIX socket file and set the proper permissions
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld


COPY ./conf/start.sh .
RUN chmod 744 ./start.sh
# ENTRYPOINT ./start.sh

EXPOSE 3306

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
# CMD [ "mysqld", "--bind-address=0.0.0.0" ]