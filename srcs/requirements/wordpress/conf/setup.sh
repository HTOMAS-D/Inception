mkdir /var/www
mkdir /var/www/html

# cd /var/www/html
 
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
rm -rf latest.tar.gz
cp /wordpress/wp-config-sample.php /wordpress/wp-config.php
cp -ra /wordpress /var/www/html/wordpress #might change wordpress for domain
rm -rf wordpress

cd /var/www/html/wordpress
# sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
# sed -i "s/password_here/$MYSQL_USER_PASS/g" wp-config.php
# sed -i "s/localhost/$MYSQL_HOST/g" wp-config.php
# sed -i "s/database_name_here/$MYSQL_DB/g" wp-config.php