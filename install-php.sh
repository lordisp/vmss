#!/bin/bash
PHPVERSION="8.1"
# Install PHP $(phpversion)
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php$(phpversion) -y

# Installing PHP Extensions
sudo apt install php$(phpversion)-dev php$(phpversion)-xdebug php$(phpversion)-bcmath php$(phpversion)-bz2 php$(phpversion)-cli php$(phpversion)-curl php$(phpversion)-common php$(phpversion)-dba php$(phpversion)-gd php$(phpversion)-mcrypt php$(phpversion)-mysql php$(phpversion)-psr php$(phpversion)-redis php$(phpversion)-sqlite3 php$(phpversion)-uuid php$(phpversion)-xdebug php$(phpversion)-xml php$(phpversion)-zip autoconf automake -y

# Enable Code Coverage
echo "xdebug.mode=coverage" >> "/etc/php/$(phpversion)/cli/php.ini"

# Installing kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl