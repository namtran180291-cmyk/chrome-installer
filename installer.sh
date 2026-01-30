#!/bin/bash
set -e
curl -O -J -L https://github.com/namtran180291-cmyk/chrome-installer/releases/download/1.0.0/chrome.tar.gz
tar -xf chrome.tar.gz
rm chrome.tar.gz
cd chrome
chmod +x ./chrome-browser
mv ./chrome-browser /usr/bin/chrome-browser
chrome-browser -c profile.json
sleep 2h
