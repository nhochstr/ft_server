FROM debian:buster

RUN apt-get -y update \
&& apt-get -y upgrade

RUN apt-get -y install nginx

WORKDIR /var/www/

EXPOSE 80

RUN service nginx start
CMD nginx -g "daemon off;"
