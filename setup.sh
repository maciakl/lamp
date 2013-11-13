#!/bin/bash

# Setup unattended access for mysql-server
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password_again password toor'
sudo apt-get -y update && sudo apt-get -y -q install apache2 php5 php5-mysql mysql-server mysql-client

# install nonessential stuff
sudo apt-get -y -q install vim curl php-pear

# install phpunit and phpdocumentor
sudo pear channel-update pear.php.net
sudo pear upgrade-all
sude pear config-set auto_discover 1
sudo pear install pear.phpunit.de/PHPUnit

sudo pear channel-discover pear.phpdoc.org
sudo pear install phpdoc/phpDocumentor

# enable mod_rewrite
sudo a2enmod rewrite
sudo service apache2 restart

# install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
