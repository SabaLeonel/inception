FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y \
    nginx \
    openssl
    

    
COPY ./tools/script.sh .
    
EXPOSE 443
# Start nginx and keep it running
ENTRYPOINT [ "sh", "/script.sh" ]