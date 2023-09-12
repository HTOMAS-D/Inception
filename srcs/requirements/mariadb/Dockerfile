# Use the official Debian base image
FROM debian:11

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# The lines apt-get clean and rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* are typically
# included in Dockerfiles to reduce the size of the final Docker image  by removing temporary files and cached package lists.


# Expose the default MariaDB port (3306)
# EXPOSE 3306

# Start the MariaDB service when the container starts
CMD ["mysqld", "--user=mysql", "--console"]
