rm -rf /etc/nginx/sites-available/wordpress

if [ -z $AUTOINDEX ]
then
	cp /tmp/wordpress /etc/nginx/sites-available/wordpress
elif [ $AUTOINDEX = OFF ]
then
	cp /tmp/wordpress-off /etc/nginx/sites-available/wordpress
else
	cp /tmp/wordpress /etc/nginx/sites-available/wordpress
fi

ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/