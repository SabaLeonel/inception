FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y openssl

# Install openssl and generate a self-signed certificate
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/nginx-certificate.crt \
    -keyout /etc/nginx/ssl/nginx-certificate.key \
    -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=lsaba-qu.42lausanne.ch/UID=lsaba-qu"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
# Start nginx and keep it running
CMD ["nginx", "-g", "daemon off;"]