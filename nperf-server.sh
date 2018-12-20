# Compiled by Apivat Pattana-anurak 
# Red Hat Enterprise Linux 6 64 bits / Linux 7 64 bits
# CentOS 6 64 bits # CentOS 7 64 bits
# CPU 2-core 1,6 GHz+ (2,4 GHz+ for 10G connections)
# RAM 4 GB / HDD 10GB Network 1 Gbps symmetric or more
# This can be a VM (VMWare, Xen, KVM...)

yum -y install perl 
yum -y update
yum -y install yum-utils wget &&\
rpm --import https://repo.nperf.com/conf/nperf-server.gpg.key &&\
wget https://repo.nperf.com/rhel/nperf-server.repo -O /tmp/nperf-server.repo &&\
yum-config-manager --add-repo /tmp/nperf-server.repo &&\
yum check-update

# install 
yum -y install nperf-server

#StartService
systemctl enable nperf-server
/etc/init.d/nperf-server start
