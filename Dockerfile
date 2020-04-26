FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install nginx \
&& apt-get -y install default-mysql-server \
&& apt-get -y install php php-fpm php-mysql php7.3-gd php-ssh2 \
&& apt-get -y install wget \
&& wget http://wordpress.org/latest.tar.gz \
&& tar xzvf latest.tar.gz \
&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz \
&& tar xvf phpMyAdmin-5.0.1-all-languages.tar.gz \
&& rm phpMyAdmin-5.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-5.0.1-all-languages/ /var/www/phpmyadmin

ADD ./srcs/wordpress /tmp/
ADD ./srcs/wordpress-off /tmp/
ADD /srcs/autoindex.sh /tmp/
ADD ./srcs/info.php /var/www/info/
ADD ./srcs/wp-config.php /wordpress/
ADD /srcs/db.sql /tmp/

RUN service mysql start \
&& service php7.3-fpm start \
&& service nginx start \
	&& mysql -u root < /tmp/db.sql \
	&& rsync -avP /wordpress/ /var/www/wordpress/ \
	&& chown -R root:www-data /var/www/* \
	&& mkdir /var/www/wordpress/wp-content/uploads \
	&& chown -R root:www-data /var/www/wordpress/wp-content/uploads \
	&& rm -rf /etc/nginx/sites-enabled/default \
&& service php7.3-fpm restart\
&& yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
&& service nginx restart

EXPOSE 80
EXPOSE 443

CMD bash /tmp/autoindex.sh \ 
&& service mysql start \
&& service php7.3-fpm restart \
&& nginx -g "daemon off;"
