all: build

.PHONY: all build push

build:
	docker build -t fixate/redis-server:2.8.9 .

push:
	docker push fixate/redis-server
