#!/bin/bash  -x

#adduser --disabled-password --gecos "" $NEW_USER
######### Script dies here in docker
#gpasswd -a $NEW_USER sudo

## delete user for a fresh start
sudo deluser $NEW_USER sudo
userdel -r $NEW_USER
rm -rf /home/$NEW_USER

adduser --disabled-password --gecos "" $NEW_USER
echo $NEW_USER:$NEW_USER_PASSWORD | chpasswd
gpasswd -a $NEW_USER sudo


## just do all this as root then;  chown -R $NEW_USER /home/$NEW_USER

cd /home/$NEW_USER/
mkdir .ssh
chmod 700 .ssh/
touch .ssh/authorized_keys
echo $PUBLIC_SSH_KEY > .ssh/authorized_keys
chmod 600 .ssh/

sudo chown -R $NEW_USER:$NEW_USER .
sudo -H -u $NEW_USER bash -c 'sudo chown u+x /.ssh'
# useradd -m -p $NEW_USER_PASSWORD -s /bin/bash $NEW_USER
# gpasswd -a $NEW_USER sudo

# whoami
# sudo -u $NEW_USER

# whoami
# $USER

# mkdir /home/$NEW_USER/.ssh
# chmod 700 .ssh
# echo $PUBLIC_SSH_KEY > /home/$NEW_USER/.ssh/authorized_keys

# chmod 600 .ssh/authorized_keys
