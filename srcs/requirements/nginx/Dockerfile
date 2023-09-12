FROM debian:11

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
