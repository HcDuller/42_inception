#!/bin/sh
adduser -D -g 'www' www;
openssl req -x509 -nodes -newkey rsa:4096 -out public_key.crt -config /tmp/cert.conf;
cp ./pk_inception.key /etc/ssl/private/;
cp ./public_key.crt /etc/ssl/certs/;
chown -R www:www /var/lib/nginx;
chown -R www:www /data;