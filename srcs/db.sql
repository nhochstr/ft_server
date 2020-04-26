CREATE DATABASE wordpress;
CREATE USER admin@localhost IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON wordpress.* TO admin@localhost;
FLUSH PRIVILEGES;