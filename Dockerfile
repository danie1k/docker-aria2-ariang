# https://github.com/linuxserver/docker-baseimage-alpine
FROM ghcr.io/linuxserver/baseimage-alpine:3.14

ARG ARIANG_VERSION="1.2.2"
ARG DOCKERIZE_VERSION="v0.6.1"
WORKDIR /tmp/

RUN set -ex \
 && apk -U upgrade \
 && apk add --no-cache --update \
    bash curl coreutils \
    aria2 \
    ruby ruby-bundler ruby-xmlrpc ruby-dev \
    darkhttpd \
### AriaNG
 && curl -o ariang.zip -L "https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VERSION}/AriaNg-${ARIANG_VERSION}.zip" \
 && mkdir /ariang && unzip -d /ariang ariang.zip \
### Dockerize
 && curl -o dockerize.tar.gz -L "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \
 && tar -C /usr/local/bin -xzf dockerize.tar.gz && chmod +x /usr/local/bin/dockerize \
### Cleanup
 && rm -rf /usr/share/ri /var/cache/apk/* /tmp/*

WORKDIR /
COPY ./root/ /

EXPOSE 6800 8080
VOLUME /download /config

RUN ["/init"]
