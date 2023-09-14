FROM debian:11


# RUN: This instruction is used to execute a command within the Docker container during the image build process.
# apt-get install: This is a Debian/Ubuntu package manager command used to install packages.
# nginx openssl libssl-dev wget: These are the packages you are installing. Here's what each package does:
# nginx: The Nginx web server.
# openssl: Provides the OpenSSL library for SSL/TLS support.
# libssl-dev: Development files for OpenSSL, which are often required for building other software with SSL support.
# wget: A command-line tool for downloading files from the internet.
# -yq: These are command-line options for apt-get:
# -y: Assumes "yes" as the answer to all prompts, allowing for a non-interactive installation.
# -q: Suppresses output messages, making the installation quieter.

# Update package lists and install packages
RUN apt-get update && \
    apt-get install nginx openssl wget -yq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /etc/nginx/ssl

# Copy Nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Generate SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/privatekey.key -out /etc/ssl/certs/certificate.crt -subj "/C=PT/L=Lisboa/O=42Lisboa/OU=Student/CN=htomas-d.42.fr"

# Start Nginx in daemon mode
CMD [ "nginx", "-g", "daemon off;" ]