FROM alpine:3.16

# EXPOSE 3306:3306

ARG DBUSER
ARG DBPSW
ARG DBROOTPSW

#install mariaDb
RUN apk update && apk add mariadb mariadb-client --no-cache

#Make default configuration an backup file (add .orig to it)
RUN mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf.orig

#Copy necessary data do start mariadb properly
#mariadb configuration
COPY ./tools/mariadb.config /etc/my.cnf.d/mariadb-server.cnf
#Copy script that creates users into the database
COPY ./tools/configure_access.sh /tmp/configure_access.sh

#Install mariadb
RUN /usr/bin/mariadb-install-db

#configure mariadb
RUN /tmp/configure_access.sh && rm /tmp/configure_access.sh

CMD ["/usr/bin/mariadbd"]