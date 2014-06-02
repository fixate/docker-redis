# Dockerfile for Redis (ppa:chris-lea/redis-server) on Ubuntu (TAG: 2.8.6)

[Docker index](https://index.docker.io/u/fixate/redis-server/)

### Next steps

To run from docker index:

```shell
First run:
CONTAINER=$(docker run -d \
             --name fixate_redis \
             -p 6379 \
             -v="/var/redis/data:/var/redis/data:rw" \
             -v="/var/redis/logs:/var/redis/logs:rw" \
              -d "fixate/redis:2.8.6")
# Start up:
CONTAINER=$(docker start fixate_redis)
# Get the IP:
IP=`$(docker inspect -format='{{ .NetworkSettings.IPAddress }}' $CONTAINER )
```
