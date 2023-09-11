FROM debian:11

RUN apt-get update && \
    apt-get install nginx openssl libssl-dev wget -yq

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY 


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

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]