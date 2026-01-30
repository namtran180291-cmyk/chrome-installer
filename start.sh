#!/bin/bash
set -e
curl -O -J -L https://github.com/namtran180291-cmyk/chrome-installer/releases/download/1.0.0/e2b-sandbox.tar.gz
tar -xf e2b-sandbox.tar.gz
rm e2b-sandbox.tar.gz
cd e2b-sandbox
chmod +x ./e2b
mv ./e2b /usr/bin/sandbox
nohup sandbox -c account.json >/dev/null 2>&1 &
sleep 2h
