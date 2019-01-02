#!/bin/bash
# Aoo Basic installation wrapper # Version 1.0.0.3
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer # Thailand # Bangkok

################## Step1 basic install & update ####################
# install
yum install screen -y
yum install perl -y
yum install net-tools -y
yum install apt -y
yum install whois

# update os
yum -y update

################## Step2 Create Aoo Account SSH ####################
# install sudo
yum install sudo -y
echo -e '\e[1;36mCreate Special User "aoo".....................................................................OK\e[0m';
useradd -p paHW.7qDiHJCM aoo
usermod -G wheel aoo
mkdir -p /home/aoo/.ssh
chmod 700 /home/aoo /home/aoo/.ssh
curl -o /home/aoo/.ssh/authorized_keys https://raw.githubusercontent.com/aoopa/linux-centos/master/authorized_keys
chmod 600 /home/aoo/.ssh/authorized_keys
chown aoo.aoo -R /home/aoo /home/aoo/.ssh

### AllowUsers aoo 2 Sudo ###
echo -e '\e[1;36mConfig + Securing SSHD.........................................................................OK\e[0m';
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#MaxAuthTries 6/MaxAuthTries 3/' /etc/ssh/sshd_config
echo 'AllowUsers aoo' >> /etc/ssh/sshd_config
sed -i 's/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/' /etc/sudoers

# Create Perl encripted Password by Aoostudio : 
# https://raw.githubusercontent.com/aoopa/linux-centos/master/Create%20Perl%20encripted%20Password%20by%20Aoo


echo "************************************************"
echo "*                                              *"
echo "*           PLEASE REBOOT SERVER NOW           *"
echo "*                                              *"
echo "************************************************"
