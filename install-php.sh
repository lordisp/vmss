#!/bin/bash
# Install PHP 8.1
sudo apt update -y && apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php8.1 -y

# Installing PHP Extensions
sudo apt install php8.1-dev php8.1-xdebug php8.1-bcmath php8.1-bz2 php8.1-cli php8.1-curl php8.1-common php8.1-dba php8.1-gd php8.1-mcrypt php8.1-mysql php8.1-psr php8.1-redis php8.1-sqlite3 php8.1-uuid php8.1-xdebug php8.1-xml php8.1-zip sqlite autoconf automake -y

# Enable Code Coverage
echo "xdebug.mode=coverage" >> "/etc/php/8.1/cli/php.ini"

# Installing compser
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Installing kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Installing kubelogin
apt install jq -y
wget https://github.com/Azure/kubelogin/releases/download/$(curl https://api.github.com/repos/Azure/kubelogin/releases/latest -s | jq .tag_name -r)/kubelogin-linux-amd64.zip
unzip kubelogin-linux-amd64.zip && rm kubelogin-linux-amd64.zip
sudo mv bin/linux_amd64/kubelogin /usr/bin

# Installing dot net core
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-6.0