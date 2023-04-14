# https://wiki.alpinelinux.org/wiki/WordPress
# https://www.cyberciti.biz/faq/how-to-install-php-7-fpm-on-alpine-linux/
FROM alpine:3.16

RUN apk update
#install php
RUN apk add php8 php8-fpm --no-cache
#install wget to download wordpress
RUN apk add wget --no-cache
#create and navegete to folder where wordpress will be downloaded
RUN mkdir /usr/local/apps
RUN cd /usr/local/apps
#Download latest wordpress
RUN wget http://wordpress.org/latest.tar.gz
#Extracts tar file (its content will reside in /usr/local/apps/wordpress)
RUN tar -xzvf latest.tar.gz
#Delete downloaded file	
RUN rm latest.tar.gz

CMD ["/bin/sh"]