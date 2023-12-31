# Use the official Debian base image
FROM debian:buster

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring \
	redis \
	php-redis \
	coreutils \
	&& rm -rf /var/lib/apt/lists/*


# Get wp cli to core install and use
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
# Create a directory for PHP runtime files to enable PHP to start correctly
RUN mkdir /run/php

COPY ./conf/setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh

# Create a custom entrypoint script
COPY ./conf/entrypoint.sh .
RUN chmod +x entrypoint.sh

WORKDIR /var/www/html/

# Use the custom entrypoint script to execute the setup.sh script and keep the container running
ENTRYPOINT ["/entrypoint.sh"]