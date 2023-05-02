#!/bin/sh
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
/usr/bin/mariadbd &
sleep 2
mysql --user=root -e "CREATE USER 'admin'@'%' IDENTIFIED BY '1234';"
mysql --user=root -e "CREATE DATABASE wordpress;"
mysql --user=root -e"GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
mysql --user=root -e"FLUSH PRIVILEGES;"
mariadb-admin shutdown
#/usr/bin/mariadbd