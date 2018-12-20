#!/bin/bash
# Aoo installation wrapper 
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer


##### Step 1 Install #####
# Centos 6
curl -fsSL https://mackerel.io/file/script/setup-all-yum.sh | MACKEREL_APIKEY='6PdHGkAkfTr2bX5Rma4BRi7FL3J8bmgsces8fSPj5UPD' sh
# Chk Status Centos 6
/var/log/mackerel-agent.log

# Centos 7
curl -fsSL https://mackerel.io/file/script/setup-all-yum-v2.sh | MACKEREL_APIKEY='6PdHGkAkfTr2bX5Rma4BRi7FL3J8bmgsces8fSPj5UPD' sh
# Chk Status Centos 7
sudo journalctl -u mackerel-agent.service

# Debian 8 or Later
wget -q -O - https://mackerel.io/file/script/setup-all-apt-v2.sh | MACKEREL_APIKEY='6PdHGkAkfTr2bX5Rma4BRi7FL3J8bmgsces8fSPj5UPD' sh
# Chk Status Debian 8 or Later
sudo journalctl -u mackerel-agent.service

#All Linux Install 
curl -O https://mackerel.io/file/agent/tgz/mackerel-agent-latest.tar.gz

cd mackerel-agent && ./mackerel-agent --conf=./mackerel-agent.conf
