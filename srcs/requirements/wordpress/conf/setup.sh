mkdir /var/www
mkdir /var/www/html

# cd /var/www/html
 if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	curl -LO https://wordpress.org/latest.tar.gz
	tar xzvf latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress
	cp wp-config-sample.php wp-config.php
	# cp -ra /wordpress /var/www/html/wordpress #might change wordpress for domain

	# cd /var/www/html/wordpress
	sed -i "s/username_here/$DB_USER/g" wp-config.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
	sed -i "s/localhost/$DB_HOST/g" wp-config.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER} ${WP_EMAIL} --user_pass=${WP_USER_PASS};
fi
/usr/sbin/php-fpm7.3 -F
exec "$@"
