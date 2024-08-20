build-alpine-base:
	docker compose build alpine-base --build-arg="PANDOC_VERSION=3.1.13" --build-arg="ALPINE_VERSION=3.19" --build-arg="LIMARKA_VERSION=20.7.13.pre.365"
test-alpine-base:
	docker compose up test-alpine-base
exec-alpine-base:
	docker run --rm -it --entrypoint="/bin/sh" reinanhs/limarka:20.7.13.pre.365-alpine-v3.19-base