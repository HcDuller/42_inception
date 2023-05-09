# https://wiki.alpinelinux.org/wiki/WordPress
# https://www.cyberciti.biz/faq/how-to-install-php-7-fappm-on-alpine-linux/
# https://www.digitalocean.com/community/tutorials/php-fpm-nginx
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
FROM alpine:3.16

ARG DBNAME
ARG DBUSER
ARG DBPSW

RUN adduser -D -g 'www' www
RUN apk update
#install php
RUN apk add php8-fpm php8-soap php8-openssl php8-gmp php8-pdo_odbc php8-json php8-dom php8-pdo php8-zip php8-mysqli php8-sqlite3 php8-apcu php8-pdo_pgsql php8-bcmath php8-gd php8-odbc php8-pdo_mysql php8-pdo_sqlite php8-gettext php8-xmlreader php8-bz2 php8-iconv php8-pdo_dblib php8-curl php8-ctype --no-cache
#install wget to download wordpress
RUN apk add wget --no-cache
#install curl to download salt
RUN apk add curl --no-cache

WORKDIR /tmp
#Download Wordpress latest release and extracts it.
RUN mkdir -p /data/www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
#Moves wordpress install folder to volume
RUN mv -n ./wordpress /data/www/

#Copy default configuration sample provided with wordpress fresh install
RUN cp /data/www/wordpress/wp-config-sample.php /data/www/wordpress/wp-config.php
#Replace lines of interest (database information and salt) //https://api.wordpress.org/secret-key/1.1/salt/
RUN sed -i "s/^.*DB_NAME.*$/define('DB_NAME', '${DBNAME}');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_USER.*$/define('DB_USER', '${DBUSER}');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_PASSWORD.*$/define('DB_PASSWORD', '${DBPSW}');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_HOST.*$/define('DB_HOST', 'mariadb');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_CHARSET.*$/define('DB_CHARSET', 'utf8mb4');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'AUTH_KEY'.*$//" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'SECURE_AUTH_KEY'.*$//" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'LOGGED_IN_KEY'.*$//" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'NONCE_KEY'.*$//" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'AUTH_SALT'.*$//" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'SECURE_AUTH_SALT'.*$//" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'LOGGED_IN_SALT'.*$//" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'NONCE_SALT'.*$//" /data/www/wordpress/wp-config.php
RUN curl https://api.wordpress.org/secret-key/1.1/salt/ >> /data/www/wordpress/wp-config.php

RUN chown -R www:www /data

RUN mv /etc/php8/php-fpm.conf /etc/php8/php-fpm.conf.orig
COPY ./tools/php-fpm.conf /etc/php8/php-fpm.conf

RUN mv /etc/php8/php-fpm.d/www.conf /etc/php8/php-fpm.d/www.conf.orig
COPY ./tools/php-fpm.d_www.conf /etc/php8/php-fpm.d/www.conf

RUN mv /etc/php8/php.ini /etc/php8/php.ini.orig
COPY ./tools/php.ini /etc/php8/

CMD ["php-fpm8","-F"]