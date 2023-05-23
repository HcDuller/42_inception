FROM alpine:3.16

RUN apk update && apk add redis --no-cache
RUN sed -i '/bind 127.0.0.1 -::1/d' /etc/redis.conf

ENTRYPOINT ["redis-server","--protected-mode no"]