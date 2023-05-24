FROM alpine:3.17

RUN apk update && apk upgrade
RUN mkdir -p /data/adminer
RUN apk add php \
	php-fpm \
	php-curl \
	php-gd \
	php-pdo_mysql \
	php-session --no-cache

COPY ./tools/setup.sh /etc/setup.sh
RUN /etc/setup.sh

COPY ./tools/php.ini /etc/php81/
COPY ./tools/php-fpm.conf /etc/php81/php-fpm.conf
COPY ./tools/php-fpm-adminer.conf /etc/php81/php-fpm.d/adminer.conf
COPY ./tools/adminer-4.8.1-mysql.php /data/adminer/index.php

CMD ["php-fpm81","-F"]