#!/bin/sh
mysql_install_db
/etc/init.d/mysql start
if [ -d "/var/lib/mysql/$MYSQL_DB"]
then
    echo "Database already exist"
else
service mariadb start
mysql_secure_installation << _EOF_
Y
$MYSQL_ROOT_PASS
$MYSQL_ROOT_PASS
Y
n
Y
Y
_EOF_
echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASS'; FLUSH PRIVILEGES;" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB; GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASS'; FLUSH PRIVILEGES;" | mysql -uroot
sleep 1
service mariadb stop
fi

exec "$@"