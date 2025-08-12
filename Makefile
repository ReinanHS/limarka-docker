build-alpine-base:
	docker compose build alpine-base --build-arg="PANDOC_VERSION=3.7.0.2" --build-arg="ALPINE_VERSION=3.22" --build-arg="LIMARKA_VERSION=20.7.13.pre.365"
test-alpine-base:
	docker compose up test-alpine-base
exec-alpine-base:
	docker run --rm -it --entrypoint="/bin/sh" reinanhs/limarka:20.7.13.pre.365-alpine-v3.22-base
