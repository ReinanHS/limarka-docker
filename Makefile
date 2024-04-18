build-alpine-base:
	docker-compose build alpine-base --no-cache --build-arg="ALPINE_VERSION=3.19"