#!/bin/bash

# Create a suer and set the password
adduser --disabled-password --gecos "" $NEW_USER
echo $NEW_USER:$NEW_USER_PASSWORD | chpasswd
gpasswd -a $NEW_USER sudo

#create .ssh directory
cd /home/$NEW_USER/
mkdir .ssh
chmod 700 .ssh/

# Upload ssh public key
touch .ssh/authorized_keys
echo $PUBLIC_SSH_KEY > .ssh/authorized_keys
chmod 600 .ssh/

# set permissions on directory
sudo chown -R $NEW_USER:$NEW_USER .
sudo -H -u $NEW_USER bash -c 'chmod u+x .ssh/'

#remove root credentials
echo $NEW_USER_PASSWORD | sudo -S sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
echo $NEW_USER_PASSWORD | sudo -S sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
echo $NEW_USER_PASSWORD | sudo -S service ssh restart
