#!/usr/bin/env bash
set -eo pipefail

[ ! -d /var/redis/data ] && mkdir -p /var/redis/data
chown redis:redis /var/redis/data
chmod 700 /var/redis/data

[ ! -d /var/redis/logs ] && mkdir -p /var/redis/logs
chown redis:redis /var/redis/logs
chmod 700 /var/redis/logs

exec /sbin/setuser redis /usr/bin/redis-server
