# https://wiki.alpinelinux.org/wiki/WordPress
# https://www.cyberciti.biz/faq/how-to-install-php-7-fappm-on-alpine-linux/
# https://www.digitalocean.com/community/tutorials/php-fpm-nginx
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
FROM alpine:3.16

RUN adduser -D -g 'www' www
RUN apk update
#install php
RUN apk add php8-fpm php8-soap php8-openssl php8-gmp php8-pdo_odbc php8-json php8-dom php8-pdo php8-zip php8-mysqli php8-sqlite3 php8-apcu php8-pdo_pgsql php8-bcmath php8-gd php8-odbc php8-pdo_mysql php8-pdo_sqlite php8-gettext php8-xmlreader php8-bz2 php8-iconv php8-pdo_dblib php8-curl php8-ctype --no-cache
#install wget to download wordpress
RUN apk add wget --no-cache
#intall openrc (init system)
#RUN apk add openrc --no-cache
#RUN mkdir /run/openrc
#RUN touch /run/openrc/softlevel
#create and navegete to folder where wordpress will be downloaded
WORKDIR /tmp
RUN mkdir -p /data/www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN cp -r ./wordpress /data/www/
#Download Wordpress
# RUN wget http://wordpress.org/latest.tar.gz
#Extracts tar file (its content will reside in /usr/local/apps/wordpress)
# RUN tar -xzvf latest.tar.gz
#Delete downloaded file	
#RUN rm latest.tar.gz

RUN chown -R www:www /data

RUN mv /etc/php8/php-fpm.conf /etc/php8/php-fpm.conf.orig
COPY ./php-fpm.conf /etc/php8/php-fpm.conf

RUN mv /etc/php8/php-fpm.d/www.conf /etc/php8/php-fpm.d/www.conf.orig
COPY ./php-fpm.d_www.conf /etc/php8/php-fpm.d/www.conf

RUN mv /etc/php8/php.ini /etc/php8/php.ini.orig
COPY ./php.ini /etc/php8/

CMD ["/bin/sh"]