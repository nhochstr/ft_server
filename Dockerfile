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
&& mv phpMyAdmin-5.0.1-all-languages/ /var/www/html/phpmyadmin


ADD ./srcs/info.php /var/www/html/
ADD ./srcs/wordpress /etc/nginx/sites-available/
ADD ./srcs/wp-config.php /wordpress
ADD /srcs/db.sql /tmp/

RUN service mysql start \
&& service php7.3-fpm start \
&& service nginx start \
	&& mysql -u root < /tmp/db.sql \
	&& rsync -avP /wordpress/ /var/www/html/ \
	&& chown -R root:www-data /var/www/html/* \
	&& mkdir /var/www/html/wp-content/uploads \
	&& chown -R root:www-data /var/www/html/wp-content/uploads \
	&& ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/ \
	&& rm /etc/nginx/sites-enabled/default \
&& service php7.3-fpm restart\
&& yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
&& service nginx restart

EXPOSE 80
EXPOSE 443

# CMD service mysql start \
# && service php7.3-fpm restart \
# && nginx -g "daemon off;"
