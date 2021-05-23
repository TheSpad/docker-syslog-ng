FROM ghcr.io/linuxserver/baseimage-alpine:3.13

LABEL maintainer="Adam Beardwood"
LABEL org.opencontainers.image.source=https://github.com/TheSpad/docker-syslog-ng

RUN \
  echo "**** install packages ****" && \
  apk add -U --upgrade --no-cache  \
    bash \
    curl && \
  apk add -U --upgrade --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
    syslog-ng \
    syslog-ng-add-contextual-data \
    syslog-ng-amqp \
    syslog-ng-graphite \
    syslog-ng-http \ 
    syslog-ng-json \
    syslog-ng-map-value-pairs \
    syslog-ng-redis \
    syslog-ng-scl \
    syslog-ng-sql \
    syslog-ng-stardate \
    syslog-ng-stomp \
    syslog-ng-tags-parser \
    syslog-ng-xml

COPY root/ /

EXPOSE 5514/udp 6601/tcp 6514/tcp

VOLUME /config