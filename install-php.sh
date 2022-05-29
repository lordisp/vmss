#!/bin/bash
# Install PHP 8.1
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php8.1 -y

# Installing PHP Extensions
sudo apt install php8.1-dev php8.1-xdebug php8.1-bcmath php8.1-bz2 php8.1-cli php8.1-curl php8.1-common php8.1-dba php8.1-gd php8.1-mcrypt php8.1-mysql php8.1-psr php8.1-redis php8.1-sqlite3 php8.1-uuid php8.1-xdebug php8.1-xml php8.1-zip autoconf automake -y