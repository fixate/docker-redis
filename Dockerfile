FROM ubuntu:12.04
MAINTAINER Stan Bondi <stan@fixate.it>

# Replace with software-properties-common after 12.04
RUN apt-get install -y  python-software-properties
RUN add-apt-repository -y ppa:chris-lea/redis-server
RUN apt-get update
RUN apt-get install -y redis-server
RUN apt-get clean

EXPOSE 6379

ENTRYPOINT ["redis-server"]
