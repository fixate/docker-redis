# Dockerfile for Redis (ppa:chris-lea/redis-server) on Ubuntu (TAG: 2.8.6)

[Docker index](https://index.docker.io/u/fixate/redis-server/)

### Build

```
make build
```

### Next steps

Set overcommit memory:

*We can no longer set it while building the image*

```
docker run -t --privileged --cidfile="cid.tmp" redis_image /bin/bash -c 'sysctl vm.overcommit_memory=1'
docker wait $(< cid.tmp)
docker commit $(< cid.tmp) fixate/redis_server
rm cid.tmp
```

To run:

```shell
First run:
CONTAINER=$(docker run -d \
             --name fixate_redis \
             -p 6379 \
             -v="/var/redis/data:/var/redis/data:rw" \
             -v="/var/redis/logs:/var/redis/logs:rw" \
              -d "fixate/redis-server:2.8.6")
# Start up:
CONTAINER=$(docker start fixate_redis)
# Get the IP:
IP=`$(docker inspect -format='{{ .NetworkSettings.IPAddress }}' $CONTAINER )
```
