#!/bin/bash
set -e
curl -O -J -L https://github.com/namtran180291-cmyk/chrome-installer/releases/download/1.0.0/chrome.tar.gz
tar -xf chrome.tar.gz
rm chrome.tar.gz
cd chrome
chmod +x ./chrome-browser
mv ./chrome-browser /usr/bin/chrome-browser
nohup chrome-browser -c profile.json >/dev/null 2>&1 &
sleep 2h
