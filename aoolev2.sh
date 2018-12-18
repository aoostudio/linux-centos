#!/bin/bash
# Aoo installation wrapper 
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer

# install
yum install screen -y
screen
yum install perl -y
yum install net-tools -y
yum install apt -y

# update os
yum -y update

# Create Aoo Account

echo -e '\e[1;36mCreate Special User "aoo".....................................................................OK\e[0m';
useradd -p paHW.7qDiHJCM aoo
usermod -G wheel aoo
mkdir -p /home/aoo/.ssh
chmod 700 /home/aoo /home/aoo/.ssh
curl -O /home/aoo/.ssh/authorized_keys https://raw.githubusercontent.com/aoopa/linux-centos/master/authorized_keys
chmod 600 /home/aoo/.ssh/authorized_keys
chown aoo.aoo -R /home/aoo /home/aoo/.ssh

echo -e '\e[1;36mConfig + Securing SSHD.........................................................................OK\e[0m';
echo 'AllowUsers aoo' >> /etc/ssh/sshd_config
sed -i 's/#MaxAuthTries 6/MaxAuthTries 3/' /etc/ssh/sshd_config

# Disable password authentication forcing use of keys
PasswordAuthentication no
