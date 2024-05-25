FROM    debian:bullseye

RUN     apt-get update && apt-get upgrade -y
RUN     apt-get install -y mariadb-server 

RUN     mkdir -p /run/mysqld /var/lib/mysql

COPY    ./conf/50-server.cnf /etc/mysql/50-server.cnf

COPY    ./tools/script.sh /usr/local/script.sh
RUN     chmod +x /usr/local/script.sh


EXPOSE  3306

ENTRYPOINT ["sh","/usr/local/script.sh"]