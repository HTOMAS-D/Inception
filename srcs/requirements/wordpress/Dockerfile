# Use the official Debian base image
FROM debian:11

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get clean && \
	apt-get -y install curl && \
	apt-get -y install vim && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/setup.sh .
# RUN bash setup.sh
WORKDIR /var/www/html
# COPY 
# RUN 
# ENTRYPOINT ./start.sh
ENTRYPOINT [ "tail", "-f", "/dev/null" ]

