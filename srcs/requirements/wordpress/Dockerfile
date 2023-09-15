# Use the official Debian base image
FROM debian:11

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# COPY 
# RUN 
# ENTRYPOINT ./start.sh
ENTRYPOINT [ "tail", "-f", "/dev/null" ]

