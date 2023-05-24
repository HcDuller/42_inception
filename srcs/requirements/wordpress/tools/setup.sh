#!/bin/sh
adduser -D -g 'www' www;
mkdir -p /data/www;
wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz;
mv -n ./wordpress /data/www/;
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
chown -R www:www /data
mv /etc/php81/php-fpm.conf /etc/php81/php-fpm.conf.orig
mv /etc/php81/php-fpm.d/www.conf /etc/php81/php-fpm.d/www.conf.orig
mv /etc/php81/php.ini /etc/php81/php.ini.orig