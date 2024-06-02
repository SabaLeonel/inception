FROM debian:buster

ARG MYSQL_DB_NAME
ARG MYSQL_USER
ARG MYSQL_PASS
ARG MYSQL_ROOT_PASS

RUN apt -y update && apt -y upgrade && apt -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /tmp/script.sh

RUN service mysql start && sh /tmp/script.sh

EXPOSE 3306

CMD ["mysqld"]