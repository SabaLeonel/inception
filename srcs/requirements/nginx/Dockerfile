FROM debian:buster

RUN apt-get update && apt-get install nginx -y && apt install openssl -y

COPY ./tools/script.sh /etc/nginx/sites-available/

COPY ./tools/script.sh /

CMD ["/script.sh"]