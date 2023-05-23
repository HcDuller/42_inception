FROM alpine:3.16

RUN apk update && apk upgrade
RUN mkdir -p /data/adminer
RUN apk add php php8-fpm php8-curl php8-gd php8-pdo_mysql php-session --no-cache

COPY ./tools/setup.sh /etc/setup.sh
RUN /etc/setup.sh

COPY ./tools/php.ini /etc/php8/
COPY ./tools/php-fpm.conf /etc/php8/php-fpm.conf
COPY ./tools/php-fpm-adminer.conf /etc/php8/php-fpm.d/adminer.conf
COPY ./tools/adminer-4.8.1-mysql.php /data/adminer/index.php

CMD ["php-fpm8","-F"]