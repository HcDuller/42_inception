FROM alpine:3.15

#Install needed tools
RUN apk update && apk upgrade
RUN apk add nginx --no-cache
RUN apk add openssl --no-cache

#Create needed directories
RUN mkdir -p /data/www /etc/ssl/certs /etc/ssl/private

#Copy necessary configuration
COPY ./tools/certConfig.conf /tmp/cert.conf
COPY ./tools/nginx.conf /etc/nginx/
COPY ./tools/setup.sh /tmp/setup.sh

#Setup ssl certificates in one step (reduces image layers)
RUN /tmp/setup.sh

CMD ["nginx","-g","daemon off;"]
