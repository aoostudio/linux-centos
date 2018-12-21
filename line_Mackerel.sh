#!/bin/bash
# Aoo installation Mackerel-Agent (Line Monitor Alert)
# Version 1.0.0.4
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer

##### Step 1 Basic Install #####
# install
yum install screen -y
yum install perl -y
yum install net-tools -y
yum install apt -y
yum install whois -y
# OS Update
yum -y update

##### Step 2 Download mackerel-agent #####
#All Linux Install 
curl -O https://mackerel.io/file/agent/tgz/mackerel-agent-latest.tar.gz

##### Step 3 Extract  #####
tar xvzf mackerel-agent-latest.tar.gz
rm mackerel-agent/mackerel-agent.conf 
y

##### Step 4 Download .conf ที่มี api key  #####
curl -o mackerel-agent/mackerel-agent.conf https://raw.githubusercontent.com/aoopa/linux-centos/master/mackerel-agent.conf
## ดาวน์โหล์ไฟล์ mackerel-agent.conf มาไว้ที่ mackerel-agent/mackerel-agent.conf
chmod 600 mackerel-agent/mackerel-agent.conf


##### Step 5 Compile Program  #####
cd mackerel-agent && ./mackerel-agent --conf=./mackerel-agent.conf
