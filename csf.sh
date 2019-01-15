#!/bin/bash
# Aoo CSF Firewall installation wrapper # Version 1.0.0.1
# Script Developed by Apivat Pattana-Anurak
# SysAdmin & Programmer Form #Bangkok #Thailand 

echo -e '\e[1;36mMonitor for all IP attack and automatic BAN IP for a period of time and Email Alert............OK\e[0m';
cd /root
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf
sh ./install.sh

sed -i 's/TESTING = "1"/TESTING = "0"/' /etc/csf/csf.conf
perl -pi -e 's/,2222"/,2222,35000:35999"/' /etc/csf/csf.conf
perl -pi -e 's/PS_INTERVAL = "0"/PS_INTERVAL = "100"/' /etc/csf/csf.conf
perl -pi -e 's/PS_LIMIT = "10"/PS_LIMIT = "20"/' /etc/csf/csf.conf
# perl -pi -e 's/IPV6 = "1"/IPV6 = "0"/' /etc/csf/csf.conf
cat <<EOF >>/etc/csf/csf.pignore
exe:/usr/libexec/dovecot/lmtp
exe:/usr/libexec/dovecot/managesieve-login
exe:/usr/local/bin/freshclam
exe:/usr/sbin/pure-ftpd
exe:/usr/sbin/nginx
EOF
