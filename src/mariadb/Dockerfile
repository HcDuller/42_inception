FROM alpine:3.16

EXPOSE 3306:3306
ARG DBNAME
ARG DBUSER
ARG DBPSW
#install mariaDb
RUN apk update && apk add mariadb --no-cache
RUN apk add mariadb-client --no-cache
RUN mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf.orig
COPY ./my.cnf_worked.config /etc/my.cnf.d/mariadb-server.cnf
COPY ./configure_access.sh /tmp/configure_access.sh
RUN /usr/bin/mariadb-install-db
RUN chmod 774 /tmp/configure_access.sh
RUN /tmp/configure_access.sh
#Install mariadb
#docker build ./mariadb --tag=mariadb:1.0 
#docker run -it --rm -p3306:3306 --name=mariadb mariadb:1.0 sh 

CMD ["/usr/bin/mariadbd"]

