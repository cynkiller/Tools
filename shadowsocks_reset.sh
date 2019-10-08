#!/bin/bash
#
# AWS VM shadowsocks port got blocked too often..

echo "Stop shadowsocks..."
ssserver -d stop

port=`sudo cat /etc/shadowsocks/config.json | grep server_port | sed "s/.*://" | sed "s/,//"`
echo "Old port : " $port
let port="${port}"+1
sed -i "/server_port/s/:.*/:${port},/" /etc/shadowsocks/config.json
echo "New port : " $port

echo "Start shadowsocks..."
ssserver -d start -c /etc/shadowsocks/config.json

echo "Completed."
