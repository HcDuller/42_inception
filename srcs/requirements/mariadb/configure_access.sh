#!/bin/sh
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
/usr/bin/mariadbd &
sleep 2
# mysql --user=root -e "CREATE USER 'hdecamp'@'%' IDENTIFIED BY 'thisIs4psw';"
# mysql --user=root -e "CREATE DATABASE wordpress;"
# mysql --user=root -e "GRANT ALL PRIVILEGES ON *.* TO 'hdecamp'@'%';"
# mysql --user=root -e "FLUSH PRIVILEGES;"
mysql --user=root -e "CREATE USER '${DBUSER}'@'%' IDENTIFIED BY '${DBPSW}';"
mysql --user=root -e "CREATE DATABASE ${DBNAME};"
mysql --user=root -e "GRANT ALL PRIVILEGES ON *.* TO '${DBUSER}'@'%';"
mysql --user=root -e "FLUSH PRIVILEGES;"
mariadb-admin shutdown
#/usr/bin/mariadbd