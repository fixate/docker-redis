FROM phusion/baseimage:0.9.13
MAINTAINER Stan Bondi <stan@fixate.it>

ENV HOME /root

# Regenerate SSH host keys.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y ppa:chris-lea/redis-server && \
    apt-get update && \
    apt-get install -y --no-install-recommends redis-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/service/redis
ADD redis-server.sh /etc/service/redis/run
ADD redis.conf /etc/redis/redis.conf

EXPOSE 6379

VOLUME ["/var/redis/data", "/var/redis/logs"]
