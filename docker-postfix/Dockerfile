
# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:edge

# set version label
ARG BUILD_DATE
ARG VERSION
#ARG POSTFIX_RELEASE
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="damien-abos"

ENV MYDOMAIN=domain.tld
ENV MYHOSTNAME=virtual.domain.tld
ENV MYNETWORKS="10.0.0.0/8 127.0.0.0/8 172.16.0.0/12 192.168.0.0/16"

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
VOLUME /config