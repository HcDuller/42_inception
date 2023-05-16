#!/bin/sh
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

/usr/bin/mariadbd &
while ! mysqladmin ping -hlocalhost >/dev/null 2>&1; do
    sleep 1
done
mysql --user=root -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPSW';"
mysql --user=root -e "GRANT ALL PRIVILEGES ON *.* TO '$DBUSER'@'%';"
mysql --user=root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DBROOTPSW';FLUSH PRIVILEGES;"

mariadb-admin --user=root --password="$DBROOTPSW" shutdown