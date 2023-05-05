# nginx docs https://nginx.org/en/docs/
# nginx recipe https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/
# https://www.cyberciti.biz/faq/how-to-install-nginx-web-server-on-alpine-linux/
FROM alpine:3.15

RUN apk update && apk upgrade
RUN apk add nginx --no-cache
RUN mkdir /data && mkdir /data/www
RUN adduser -D -g 'www' www

COPY ./nginx.conf /etc/nginx/
COPY ./index.html /data/www/
COPY ./phpinfo.php /data/www/

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /data

CMD ["nginx","-g","daemon off;"]
