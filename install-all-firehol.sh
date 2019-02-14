#!/bin/bash

LC_ALL=C

# you need to install a basic build environment
# this is for ubuntu, change it according to your needs for other systems
# apt-get install zlib1g-dev uuid-dev libmnl-dev gcc make git autoconf autogen automake pkg-config traceroute ipset curl nodejs zip unzip jq ulogd autoconf-archive firehol || exit 1

for x in iprange firehol netdata
do
    if [ ! -d /usr/src/${x}.git ]
        then
        echo "Downloading (git clone) ${x}..."
        git clone https://github.com/firehol/${x}.git /usr/src/${x}.git || exit 1
    else
        echo "Downloading (git pull) ${x}..."
        cd /usr/src/${x}.git || exit 1
        git pull || exit 1
    fi
done

echo
echo "Building iprange..."
cd /usr/src/iprange.git || exit 1
./autogen.sh || exit 1
./configure --prefix=/usr CFLAGS="-O2" --disable-man || exit 1
make clean
make || exit 1
make install || exit 1

echo
echo "Building firehol..."
cd /usr/src/firehol.git || exit 1
./autogen.sh || exit 1
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-man --disable-doc || exit 1
make clean
make || exit 1
make install || exit 1

echo
echo "Building netdata..."
cd /usr/src/netdata.git || exit 1
./netdata-installer.sh
