FROM alpine:3.16

# EXPOSE 3306:3306
ARG DBNAME
ARG DBUSER
ARG DBPSW
ARG WPADM
ARG WPADMPSW
ARG WPUSR
ARG WPUSRPSW

#install mariaDb
RUN apk update && apk add mariadb mariadb-client --no-cache

#Make default configuration an backup file (add .orig to it)
RUN mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf.orig

#Copy necessary data do start mariadb properly
#mariadb configuration
COPY ./tools/mariadb.config /etc/my.cnf.d/mariadb-server.cnf
#Copy script and dependencies, give then rights to execute.
COPY ./tools/configure_access.sh /tmp/configure_access.sh
RUN chmod 774 /tmp/configure_access.sh
COPY ./tools/database_dump.sql /tmp/dump.sql

#Install mariadb
RUN /usr/bin/mariadb-install-db

#configure mariadb
RUN /tmp/configure_access.sh

CMD ["/usr/bin/mariadbd"]

