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

sed -i "s/--adminLogin--/		'${WPADM}',/" /tmp/dump.sql
sed -i "s/--adminNick--/		'${WPADM}',/" /tmp/dump.sql
sed -i "s/--secondUserLogin--/		'${WPUSR}',/" /tmp/dump.sql
sed -i "s/--secondUserNick--/		'${WPUSR}',/" /tmp/dump.sql

echo $WPADMPSW > /tmp/psw.txt
TMPHASH=$(tr -d '\r\n' < /tmp/psw.txt | md5sum | tr -d ' -')
sed -i "s/--adminHash--/		'${TMPHASH}',/" /tmp/dump.sql

echo $WPUSRPSW > /tmp/psw.txt
TMPHASH=$(tr -d '\r\n' < /tmp/psw.txt | md5sum | tr -d ' -')
sed -i "s/--userHash--/		'${TMPHASH}',/" /tmp/dump.sql
# sed -i "s/--adminLogin--/		'newAdminLogin',/" ./requirements/mariadb/database_dump.sql
TMPHASH=''
rm -rfd /tmp/psw.txt

mysql --user=root $DBNAME < /tmp/dump.sql
mariadb-admin shutdown
#/usr/bin/mariadbd