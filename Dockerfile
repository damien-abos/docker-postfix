# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:edge

LABEL org.opencontainers.image.source=https://github.com/damien-abos/postfix
LABEL org.opencontainers.image.description="Postfix using LinuxServer.io"
LABEL org.opencontainers.image.licenses=GPL-3.0-or-later

LABEL maintainer="damien-abos"

ENV MYDOMAIN=domain.tld
ENV MYHOSTNAME=virtual.domain.tld
ENV MYNETWORKS="10.0.0.0/8 127.0.0.0/8 172.16.0.0/12 192.168.0.0/16"
ENV SELECTOR=default

RUN \ 
  echo "**** install runtime packages ****" && \
  apk add -U --upgrade --no-cache \
    postfix \
    opendkim && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 25
VOLUME [ "/config", "/spool" ]