FROM	debian:bullseye

RUN     apt update && apt upgrade -y
RUN     apt-get install -y wget

#Installation of php, fpm, mysql
RUN     apt-get -y install \
        php7.4 \
        php-fpm \
        php-mysql \
        mariadb-client

# Create the directory for the website and set the permissions
RUN     mkdir -p /var/www/wordpress
RUN     mkdir -p /run/php
RUN     chown -R www-data:www-data /var/www

EXPOSE 9000
# assign the rights to the folder
RUN     chmod -R 755 /var/www

# Copy the configuration files
COPY    ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY    ./tools/script.sh /usr/local/script.sh
RUN     chmod +x /usr/local/script.sh


ENTRYPOINT ["sh", "/usr/local/script.sh"]
