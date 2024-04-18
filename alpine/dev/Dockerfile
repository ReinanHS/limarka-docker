# Limarka Template TCC
#
# @document https://reinanhs.github.io/limarka-template-docs/
# @license  https://github.com/reinanhs/limarka-docker/blob/master/LICENSE

ARG ALPINE_VERSION

FROM alpine:$ALPINE_VERSION

LABEL maintainer="ReinanHS <reinangabriel1520@gmil.com>" version="1.0" license="MIT"

##
# ---------- building ----------
##
RUN set -ex \
    && apk update \
    && apk add --no-cache

RUN echo -e "\033[42;37m Build Completed :).\033[0m\n"