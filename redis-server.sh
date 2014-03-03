#!/usr/bin/env bash
set -eo pipefail

[ ! -d /var/redis/data ] && mkdir -p /var/redis/data
chmod 700 /var/redis/data

[ ! -d /var/redis/logs ] && mkdir -p /var/redis/logs
chmod 700 /var/redis/logs

exec /usr/bin/redis-server
