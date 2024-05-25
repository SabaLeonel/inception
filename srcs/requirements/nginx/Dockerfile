FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y \
    nginx

COPY default /etc/nginx/sites-available/.
# COPY ./conf/script ./

CMD [ "nginx", "-g", "daemon off;" ]