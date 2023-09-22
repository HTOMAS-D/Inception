if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists"
else
mysql_install_db

service mysql start
# Set root option so that connexion without root password is not possible

mysql_secure_installation << _EOF_

Y
$DB_ROOT_PASSWORD
$DB_ROOT_PASSWORD
Y
n
Y
Y
_EOF_

#Create database and user for wordpress
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root -p $DB_ROOT_PASSWORD
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root -p $DB_ROOT_PASSWORD

sleep 1

service mysql stop
fi

exec mysqld_safe --bind-address=0.0.0.0
