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

WORKDIR /tmp
RUN mkdir -p /data/www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN mv -n ./wordpress /data/www/
RUN cp /data/www/wordpress/wp-config-sample.php /data/www/wordpress/wp-config.php

RUN sed -i "s/^.*DB_NAME.*$/define('DB_NAME', '${DBNAME}');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_USER.*$/define('DB_USER', '${DBUSER}');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_PASSWORD.*$/define('DB_PASSWORD', '${DBPSW}');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_HOST.*$/define('DB_HOST', 'mariadb');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*DB_CHARSET.*$/define('DB_CHARSET', 'utf8mb4');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'AUTH_KEY'.*$/define('AUTH_KEY',         '-GG\/4K xk1UJ#rjr[HsU^NFhnH >{GICFi5=epQdr+HJKZ{g\`STc)rEMnyl\|\/uu}');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'SECURE_AUTH_KEY'.*$/define('SECURE_AUTH_KEY',  ')+rP(v6>bKPqj@hJG%-V1q0[l=D?u*}y86F+@5^?:aijB|:-9,E(X>e>@y2E0gJR');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'LOGGED_IN_KEY'.*$/define('LOGGED_IN_KEY',    '\!ez\`dJtAddu\&w-}+by}>n,)<)Vms,hn%\/\|[2iLa.Az(YHn*\$E2%O?JSRc\|\!NsfQ*');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'NONCE_KEY'.*$/define('NONCE_KEY',        '+-8:vd%pwiO4C@4#\|YJ}Za?Ymqz3dXGQ]= nj#-\|u]r\`6LigGa\$*H>++zEfJfKps');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'AUTH_SALT'.*$/define('AUTH_SALT',        '@4y\&, UNW\|G5t-[@K(SXi~jB(@+_fM+=Hk>8b>sg654-:r6T@\|\!eXA6-zeF}i:Hp');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'SECURE_AUTH_SALT'.*$/define('SECURE_AUTH_SALT', '~X_,=}\&{{\!\&sAF\|?9+~X^{R3Q0<@\$Xg)8\|^~9-oefE#dNBG\&]-[XsFvE(8yqtv9_');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'LOGGED_IN_SALT'.*$/define('LOGGED_IN_SALT',   'AEk6lu,\`;g#v;de7Hqn8p%h\$\!DoGuP)Zm{.k^-P.F?-R-(z+\&j;:gw+0lY:6N7[P');/" /data/www/wordpress/wp-config.php
RUN sed -i "s/^.*'NONCE_SALT'.*$/define('NONCE_SALT',       'z4dGvO0-{yz+iZBKX}}bcmJ];a^~30)=v\/[C)F_Z#CjSln\|8Q)Hn@#53SV*6o-\`x');/" /data/www/wordpress/wp-config.php

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

CMD ["php-fpm8","-F"]