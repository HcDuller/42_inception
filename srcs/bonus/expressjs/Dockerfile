FROM alpine:3.16

RUN apk update && apk upgrade && apk add nodejs npm --no-cache
COPY ./tools/server /data/expressjs
WORKDIR /data/expressjs
RUN npm install

CMD [ "node", "index.js" ]