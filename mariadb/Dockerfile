FROM alpine:3.15

#install mariaDb
RUN apk update && apk upgrade && apk add && apk add mariadb --no-cache

#Install mariadb
#RUN mariadb-install-db

#Start MariaDb
#RUN /usr/bin/mariadbd-safe --data='./data'

#install Init system
RUN apk add openrc --no-cache

#Add /run/openrc/softlevel (enables use of openRC)
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel
