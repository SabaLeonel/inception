FROM    debian:buster

RUN     apt update -y && apt upgrade -y && apt-get install wget -y

RUN     apt-get install -y php7.3 \
        php-fpm \
        php-mysql \
        mariadb-client

COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY	./tools/script.sh /tmp/script.sh

EXPOSE	9000

RUN     mkdir -p /run/php

RUN     chmod +x /tmp/script.sh

ENTRYPOINT ["/tmp/script.sh"]