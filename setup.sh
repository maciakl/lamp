#!/bin/bash

S='\e[0;34m'
E='\e[0m'

# Setup unattended access for mysql-server
echo -e "${S}Installing the LAMP stack...${E}"
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password_again password toor'
sudo apt-get -y update && sudo apt-get -y -q install apache2 php5 php5-mysql mysql-server mysql-client

# install nonessential stuff
echo -e "${S}Installing the non-essential packages...${E}"
sudo apt-get -y -q install vim curl php-pear

# install phpunit and phpdocumentor
echo -e "${S}Installing PHPUnit and PHPDocumentor...${E}"
sudo pear channel-update pear.php.net
sudo pear upgrade-all
sudo pear config-set auto_discover 1
sudo pear install pear.phpunit.de/PHPUnit
sudo pear channel-discover pear.phpdoc.org
sudo pear install phpdoc/phpDocumentor

# enable mod_rewrite
echo -e "${S}Reconfiguring Apache... Please ignore any hostname errors here...${E}"
sudo a2enmod rewrite
sudo service apache2 restart

# install Composer
echo -e "${S}Installing Composer package manager...${E}"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo -e "${S}Done.${E}"
echo "You should now be able to vagrant ssh into the box."
