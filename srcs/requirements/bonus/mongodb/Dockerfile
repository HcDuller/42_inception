FROM alpine:3.16

RUN mkdir -p /data/db
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add mongodb mongodb-tools --no-cache

COPY ./tools/insertDummyData.sh /tmp/procedure.sh

CMD ["mongod", "--noauth"]