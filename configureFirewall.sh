#!/bin/bash

# configure firewall for ssh
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw --force enable
sudo ufw status
