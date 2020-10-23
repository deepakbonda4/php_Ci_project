#!/bin/bash

CONFIG_FILE=$1
FRONTEND_NAME=$2
BACKEND_NAME=$3
MODE=$4
BACKEND_SERVER1=$5
BACKEND_SERVER2=$6
BACKEND_SERVER1_IP=$7
BACKEND_SERVER2_IP=$8

sudo apt-get update
sudo apt-get install haproxy

mkdir haProxy2
cd haProxy2
sudo cp /etc/haproxy/haproxy.cfg .${CONFIG_FILE}.cfg

cat << EOF > ${CONFIG_FILE}.cfg

frontend ${FRONTEND_NAME}
   bind *:80
   timeout client 60s
   mode ${MODE}
   default_backend ${BACKEND_NAME}


backend ${BACKEND_NAME}

   timeout connect 10s
   timeout server 100s
   mode ${MODE}
   server ${BACKEND_SERVER1} ${BACKEND_SERVER1_IP}:80
   server ${BACKEND_SERVER2} ${BACKEND_SERVER2_IP}:80

EOF

sudo systemctl start haproxy
sudo haproxy -f ${CONFIG_FILE}.cfg

