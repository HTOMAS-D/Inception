FROM debian:11

# RUN: This instruction is used to execute a command within the Docker container during the image build process.
# apt-get install: This is a Debian/Ubuntu package manager command used to install packages.
# nginx openssl libssl-dev wget: These are the packages you are installing. Here's what each package does:
# nginx: The Nginx web server.
# openssl: Provides the OpenSSL library for SSL/TLS support.
# wget: A command-line tool for downloading files from the internet.
# -yq: These are command-line options for apt-get:
# -y: Assumes "yes" as the answer to all prompts, allowing for a non-interactive installation.
# -q: Suppresses output messages, making the installation quieter.

RUN apt-get update && \
    apt-get install nginx openssl wget -yq

RUN mkdir etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/privatekey.key -out /etc/ssl/certs/certificate.crt -subj "/C=PT/L=Lisboa/O=42Lisboa/OU=Student/CN=htomas-d.42.fr"


CMD [ "nginx", "-g", "daemon off;" ]