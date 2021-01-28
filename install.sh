#!/usr/bin/env bash

if [ ! $(which wget) ]; then
    echo 'Please install wget package'
    exit 1
fi

if [ ! $(which git) ]; then
    echo 'Please install git package'
    exit 1
fi

if [ ! $(which unzip) ]; then
    echo 'Please install zip package'
    exit 1
fi

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

if [ -z "$1" ]; then
    echo "./install.sh <your_authtoken> <region> <socks5_port> <PROXY_USER> <PROXY_PASSWORD>"
    exit 1
fi

if [ ! -e ngrok.service ]; then
    git clone --depth=1 https://github.com/safaksoylu/homeip.git
    cd homeip
fi
cp ngrok.service /lib/systemd/system/
cp socks5.service /lib/systemd/system/
cp exporter.service /lib/systemd/system/

cp ca-certificates.crt /etc/ssl/certs/

mkdir -p /opt/ngrok
mkdir -p /opt/socks5
mkdir -p /opt/exporter

cp ngrok.yml /opt/ngrok
cp socks5 /opt/socks5
cp exporter /opt/exporter

sed -i "s/<add_your_token_here>/$1/g" /opt/ngrok/ngrok.yml
sed -i "s/<region>/$2/g" /opt/ngrok/ngrok.yml
sed -i "s/<socks5_port>/$3/g" /opt/ngrok/ngrok.yml

sed -i "s/<PROXY_USER>/$4/g" /lib/systemd/system/socks5.service
sed -i "s/<PROXY_PASSWORD>/$5/g" /lib/systemd/system/socks5.service
sed -i "s/<PROXY_PORT>/$3/g" /lib/systemd/system/socks5.service

cd /opt/ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
unzip ngrok-stable-linux-arm.zip
rm ngrok-stable-linux-arm.zip

chmod +x ngrok
chmod +x  /opt/socks5/socks5
chmod +x  /opt/exporter/exporter

systemctl enable ngrok.service
systemctl start ngrok.service

systemctl enable socks5.service
systemctl start socks5.service

rm -r /home/pi/homeip
