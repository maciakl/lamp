#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password_again password toor'
sudo apt-get -y update && sudo apt-get -y -q install apache2 php5 php5-mysql mysql-server mysql-client vim curl
sudo a2enmod rewrite
sudo service apache2 restart
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
