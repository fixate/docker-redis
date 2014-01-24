all: build

.PHONY: all build push

build:
	docker build -rm -t fixate/redis-server:12.04 .

push:
	docker push fixate/redis-server
