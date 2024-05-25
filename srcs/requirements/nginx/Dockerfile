FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx


# Install openssl and generate a self-signed certificate
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SW/ST=VD/L=Lausanne/O=42/OU=42/CN=lsaba-qu.42.ch/emailAddress=lsaba-qu@student.42.fr"

RUN mkdir -p /var/www/nginx /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/script.sh /usr/local/script.sh

RUN chmod +x /usr/local/script.sh
    
EXPOSE 443
# Start nginx and keep it running
ENTRYPOINT [ "sh", "/usr/local/script.sh" ]