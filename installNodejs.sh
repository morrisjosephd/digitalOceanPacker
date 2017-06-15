#!/bin/bash

### Download Nodejs
cd -
curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs
node -v
sudo apt-get -y install build-essential
