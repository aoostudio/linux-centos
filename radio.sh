#!/bin/bash
# Aoo Installing SHOUTCast Radio Server # Version 1.0.0.1
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer Form #Bangkok #Thailand 

########################################### Step 1 #############################################
####### Step 1.1 #######
# Creaate Account
# su -  ************
adduser radio
passwd radio
# exit

su - radio

####### Step 1.2 #######
# Mack Dir & Chang Dir
mkdir download
mkdir server
cd download

####### Step 1.3 #######
# Download # https://download.nullsoft.com/shoutcast/tools/.. file name .. 
wget http://download.nullsoft.com/shoutcast/tools/sc_serv2_linux_x64-latest.tar.gz

####### Step 1.4 #######
# After the download completes, extract the sc_serv2_linux_architecture_date.tar.gz archive, 
# list the directory to locate sc_serv executable binary file and copy it to installation directory, 
# located in server folder, then move to SHOUTcast installation path, by issuing the following commands.
tar xfz sc_serv2_linux_x64-latest.tar.gz
ls
cp  sc_serv  ../server/
cd  ../server/
ls

####### Step 1.5 #######
# Now that you are located in server installation path, 
# create two directories named control and logs and you’re done with the actual installation process. 
# List your directory content to verify if everything is in place.

$ mkdir control
$ mkdir logs
$ ls

########################################### Step 2 #############################################
########################################### Confix #############################################
# nano & vi **sc_serv.conf
vi sc_serv.conf

# Add the following statements to sc_serv.conf file (example configuration).
#########################################################################
# adminpassword=password
# password=password1
# requirestreamconfigs=1
# streamadminpassword_1=password2
# streamid_1=1
# streampassword_1=password3
# streampath_1=http://radio-server.lan:8000
# logfile=logs/sc_serv.log
# w3clog=logs/sc_w3c.log
# banfile=control/sc_serv.ban
# ripfile=control/sc_serv.rip
#########################################################################
