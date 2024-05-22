FROM debian:buster

RUN apt-get update && apt-get install -y nginx && apt install openssl -y

COPY ./conf/script ./

CMD [ "sh", "script" ]