build-alpine-base:
	docker-compose build alpine-base --build-arg="ALPINE_VERSION=3.19" --build-arg="PANDOC_VERSION=3.1.13"