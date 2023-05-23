FROM alpine:3.16

RUN mkdir -p /data/ftp

RUN apk update && apk upgrade && apk add vsftpd && mkdir -p /data/ftp
COPY ./tools/vsftpd.conf /tmp/vsftpd.conf
RUN rm /etc/vsftpd/vsftpd.conf && cp /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod 777 -R /data/ftp
# RUN echo local_root=/data/ftp >> /etc/vsftpd/vsftpd.conf
# RUN echo log_ftp_protocol=YES >> /etc/vsftpd/vsftpd.conf
# RUN echo xferlog_file=/var/log/ftp/xferlog >> /etc/vsftpd/vsftpd.conf
# RUN echo anon_root=/data/ftp >> /etc/vsftpd/vsftpd.conf
# RUN echo local_enable=YES >> /etc/vsftpd/vsftpd.conf
# RUN echo write_enable=YES >> /etc/vsftpd/vsftpd.conf

CMD [ "vsftpd" ,"/etc/vsftpd/vsftpd.conf"]