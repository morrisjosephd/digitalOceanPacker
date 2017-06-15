#!/bin/bash

# install nginx
sudo apt-get -y install nginx

# configure firewall
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status

systemctl status nginx
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
