FROM alpine:3.17

RUN apk update && apk upgrade
#install php
RUN apk add php \
	php-phar \
	php-tokenizer \
	php-fpm \
	php-soap \
	php-openssl \
	php-gmp \
	php-pdo_odbc \
	php-json \
	php-dom \
	php-pdo \
	php-zip \
	php-mysqli \
	php-sqlite3 \
	php-pdo_pgsql \
	php-bcmath \
	php-gd \
	php-odbc \
	php-pdo_mysql \
	php-pdo_sqlite \
	php-gettext \
	php-xml \
	php-xmlreader \
	php-bz2 \
	php-iconv \
	php-pdo_dblib \
	php-curl \
	php-ctype \
	php-fileinfo \
	php-opcache \
	php-mbstring \
	php81-pecl-imagick \
	curl wget --no-cache
RUN apk add mariadb-client --no-cache

COPY ./tools/setup.sh /tmp/setup.sh
RUN /tmp/setup.sh

COPY ./tools/php-fpm.conf /etc/php81/php-fpm.conf
COPY ./tools/php-fpm.d_www.conf /etc/php81/php-fpm.d/www.conf
COPY ./tools/php.ini /etc/php81/
COPY ./tools/startup.sh /etc/startup.sh
RUN rm -f /tmp/*

ENTRYPOINT ["/etc/startup.sh"]
