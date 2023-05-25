FROM alpine:3.17

RUN mkdir -p /data/ftp
ARG FTP_USR
ARG FTP_PSW

RUN adduser -G root $FTP_USR --disabled-password
RUN echo "$FTP_USR:$FTP_PSW" | chpasswd
RUN apk update && apk upgrade && apk add vsftpd && mkdir -p /data/ftp
COPY ./tools/vsftpd.conf /tmp/vsftpd.conf
RUN rm /etc/vsftpd/vsftpd.conf && cp /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod 777 -R /data/ftp

CMD [ "vsftpd" ,"/etc/vsftpd/vsftpd.conf"]