FROM phusion/baseimage:0.9.8
MAINTAINER Stan Bondi <stan@fixate.it>

ENV HOME /root

# Regenerate SSH host keys.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Replace with software-properties-common after 12.04
RUN apt-get install -y  python-software-properties
RUN add-apt-repository -y ppa:chris-lea/redis-server
RUN apt-get update
RUN apt-get install -y redis-server

RUN mkdir -p /etc/service/redis
ADD redis-server.sh /etc/service/redis/run

EXPOSE 6379

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
