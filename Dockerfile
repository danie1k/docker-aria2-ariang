# Heavily inspired on https://github.com/linuxserver/docker-baseimage-alpine
FROM alpine:3.14

ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
# https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.authors="Daniel Kuruc <daniel@kuruc.dev>, linuxserver.io"
LABEL org.opencontainers.image.created="$BUILD_DATE"
LABEL org.opencontainers.image.description="aria2 + AriaNg Image based on Alpine Linux"
LABEL org.opencontainers.image.documentation="https://github.com/danie1k/docker-aria2-ariang"
LABEL org.opencontainers.image.ref.name="$BUILD_REF"
LABEL org.opencontainers.image.revision="$BUILD_REF"
LABEL org.opencontainers.image.source="https://github.com/danie1k/docker-aria2-ariang"
LABEL org.opencontainers.image.title="danie1k/aria2-ariang"
LABEL org.opencontainers.image.url="https://hub.docker.com/repository/docker/danie1k/aria2-ariang"
LABEL org.opencontainers.image.vendor="Daniel Kuruc"
LABEL org.opencontainers.image.version="$BUILD_VERSION"

ARG ARIANG_VERSION="1.2.2"
ARG DOCKERIZE_VERSION="v0.6.1"
ARG S6_OVERLAY_VERSION="v2.2.0.3"
WORKDIR /tmp/

RUN set -ex \
 && apk add --no-cache --update \
    bash curl coreutils procps shadow \
    aria2 \
    ruby ruby-bundler ruby-xmlrpc ruby-dev \
    darkhttpd \
### Create abc user
 && groupmod -g 1000 users  \
 && useradd -u 911 -U -d /config -s /bin/false abc \
 && usermod -G users abc \
 && mkdir -p /app /config /defaults \
### Download & install s6-overlay (https://buildfax.atlassian.net/wiki/spaces/DEV/pages/1903689837/)
 && curl -o s6-overlay-installer -L "https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64-installer" \
 && chmod +x s6-overlay-installer && ./s6-overlay-installer / \
### Dockerize
 && curl -o dockerize.tar.gz -L "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \
 && tar -C /usr/local/bin -xzf dockerize.tar.gz && chmod +x /usr/local/bin/dockerize \
### AriaNG
 && curl -o ariang.zip -L "https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VERSION}/AriaNg-${ARIANG_VERSION}.zip" \
 && unzip -d /app ariang.zip \
### Cleanup
 && rm -rf /usr/share/ri /var/cache/apk/* /tmp/*

WORKDIR /

ADD https://raw.githubusercontent.com/linuxserver/docker-baseimage-alpine/master/root/etc/cont-init.d/10-adduser /etc/cont-init.d/10-adduser
COPY ./root/ /

ENV PS1="$(whoami)@$(hostname):$(pwd)\\$ " \
    HOME="/root" \
    TERM="xterm"

EXPOSE 6800 8080
VOLUME /download /config

CMD ["/init"]
