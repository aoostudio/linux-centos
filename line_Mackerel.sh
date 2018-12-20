#!/bin/bash
# Aoo installation wrapper 
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer


##### Step 1 Download #####
#All Linux Install 
curl -O https://mackerel.io/file/agent/tgz/mackerel-agent-latest.tar.gz

tar xvzf mackerel-agent-latest.tar.gz
rm mackerel-agent/mackerel-agent.conf 
y

curl -o mackerel-agent/mackerel-agent.conf https://raw.githubusercontent.com/aoopa/linux-centos/master/mackerel-agent.conf
chmod 600 mackerel-agent/mackerel-agent.conf
cd mackerel-agent && ./mackerel-agent --conf=./mackerel-agent.conf
