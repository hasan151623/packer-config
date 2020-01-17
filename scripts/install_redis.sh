#!/bin/bash
apt-get update -y 
apt-get install redis-server -y

# change mexmeory to 256mb and maxmemory-policy to allkey-lru
sed -i 's/# maxmemory <bytes>/maxmemory 256mb/g;s/# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/g' /etc/redis/redis.conf
# enable Redis to start on system boot
systemctl enable redis-server.service

# restart redis server
systemctl restart redis-server.service