#!/bin/sh

mkdir -p /data/www;
wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz;
mv -n ./wordpress /data/www/;

#Copy default configuration sample provided with wordpress fresh install
cp /data/www/wordpress/wp-config-sample.php /data/www/wordpress/wp-config.php;

#Replace lines of interest (database information and salt) //https://api.wordpress.org/secret-key/1.1/salt/
sed -i "s/^.*DB_NAME.*$/define('DB_NAME', '${DBNAME}');/" /data/www/wordpress/wp-config.php;
sed -i "s/^.*DB_USER.*$/define('DB_USER', '${DBUSER}');/" /data/www/wordpress/wp-config.php;
sed -i "s/^.*DB_PASSWORD.*$/define('DB_PASSWORD', '${DBPSW}');/" /data/www/wordpress/wp-config.php;
sed -i "s/^.*DB_HOST.*$/define('DB_HOST', 'mariadb');/" /data/www/wordpress/wp-config.php;
sed -i "s/^.*DB_CHARSET.*$/define('DB_CHARSET', 'utf8mb4');/" /data/www/wordpress/wp-config.php;

chown -R www:www /data
mv /etc/php8/php-fpm.conf /etc/php8/php-fpm.conf.orig
mv /etc/php8/php-fpm.d/www.conf /etc/php8/php-fpm.d/www.conf.orig
mv /etc/php8/php.ini /etc/php8/php.ini.orig

# COPY ./tools/php-fpm.conf /etc/php8/php-fpm.conf
# COPY ./tools/php-fpm.d_www.conf /etc/php8/php-fpm.d/www.conf
# COPY ./tools/php.ini /etc/php8/