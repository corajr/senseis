#!/usr/bin/env bash

# nginx
sudo apt-get -y install nginx
sudo service nginx start

# set up nginx server
sudo cp /vagrant/.provision/nginx/nginx.conf /etc/nginx/sites-available/default
sudo chmod 644 /etc/nginx/sites-available/default
sudo service nginx restart

[ -d '/var/www/html/?PagesForBeginners' ] || (
    sudo rm -Rf /var/www/html
    cd /var/www
    sudo tar -xzf /vagrant/senseis.tar.gz
    sudo mv senseis.xmp.net html
)
