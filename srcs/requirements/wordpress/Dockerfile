FROM alpine:3.16

ARG DBNAME
ARG DBUSER
ARG DBPSW

RUN adduser -D -g 'www' www

RUN apk update
#install php
RUN apk add php8-fpm php8-soap php8-openssl php8-gmp php8-pdo_odbc php8-json php8-dom php8-pdo php8-zip php8-mysqli php8-sqlite3 php8-apcu php8-pdo_pgsql php8-bcmath php8-gd php8-odbc php8-pdo_mysql php8-pdo_sqlite php8-gettext php8-xmlreader php8-bz2 php8-iconv php8-pdo_dblib php8-curl php8-ctype curl wget --no-cache

WORKDIR /tmp

COPY ./tools/setup.sh /tmp/setup.sh
RUN /tmp/setup.sh

COPY ./tools/php-fpm.conf /etc/php8/php-fpm.conf
COPY ./tools/php-fpm.d_www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools/php.ini /etc/php8/
RUN rm -f /tmp/*

CMD ["php-fpm8","-F"]
