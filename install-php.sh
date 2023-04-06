#!/bin/bash
# Install PHP 8.2
sudo apt update -y && apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php8.2 -y

# Installing PHP Extensions
sudo apt install php8.2-dev php8.2-xdebug php8.2-bcmath php8.2-mbstring php8.2-bz2 php8.2-cli php8.2-curl php8.2-common php8.2-dba php8.2-gd php8.2-mcrypt php8.2-mysql php8.2-psr php8.2-redis php8.2-sqlite3 php8.2-uuid php8.2-xdebug php8.2-xml php8.2-zip sqlite autoconf automake -y

# Enable Code Coverage
echo "xdebug.mode=coverage" >> "/etc/php/8.2/cli/php.ini"

# Installing composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Installing kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Installing kubelogin
sudo apt-get update && sudo apt install jq unzip -y
wget https://github.com/Azure/kubelogin/releases/download/"$(curl https://api.github.com/repos/Azure/kubelogin/releases/latest -s | jq .tag_name -r)"/kubelogin-linux-amd64.zip
unzip kubelogin-linux-amd64.zip && rm kubelogin-linux-amd64.zip
sudo mv bin/linux_amd64/kubelogin /usr/bin

# Installing Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod 700 get_helm.sh
./get_helm.sh

# Installing dot net core
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-6.0