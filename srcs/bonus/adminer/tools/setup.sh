#!/bin/sh
adduser -D -g 'adminer' adminer;
chown -R adminer:adminer /data
rm /etc/php81/php-fpm.conf
rm /etc/php81/php-fpm.d/www.conf
rm /etc/php81/php.ini